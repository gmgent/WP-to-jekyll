---
layout: blog
title: Tableless models and a checkbox collection
permalink: 2008/12/tableless-models-and-a-checkbox-collection
postday: 12/05 2008
posttime: 01_44
categories: [code]
---

<p>I have always loved the sound of a table-less model. It feels so dirty. Here is one from the school of hard knocks, known as the Merchant model:</p>
<p>class Merchant &lt; ActiveRecord::Base<br />
  def self.columns() @columns ||= []; end</p>
<p>  def self.column(name, sql_type = nil, default = nil, null = true)<br />
    columns &lt;&lt; ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)<br />
  end</p>
<p>  column :merchant, :string<br />
  validates_presence_of :merchant</p>
<p>  def self.get_edit_values(page_id)<br />
    new_arr = []<br />
    Summary.find_by_sql(["<br />
      SELECT merchant, CASE LENGTH(selected) &gt; 0 WHEN TRUE THEN 1 ELSE 0 END value FROM<br />
        (SELECT value merchant, merchant selected<br />
        FROM<br />
          (SELECT merchant from merchant_pages where page_id=?) signed_up<br />
            RIGHT JOIN (SELECT DISTINCT MERCHANT value FROM retailers) distinct_m<br />
                    ON distinct_m. value = signed_up. merchant) new_alias<br />
    ORDER BY merchant<br />
      ", page_id.to_i]).each do |x|<br />
                    new_arr &lt;&lt; [x.merchant, x.value]<br />
                  end<br />
                  new_arr<br />
  end</p>
<p>  def self.get_values<br />
    Summary.find_by_sql(["<br />
      SELECT DISTINCT MERCHANT value FROM retailers order by merchant<br />
      "]).each do |x|<br />
      @columns &lt;&lt; x.value<br />
    end<br />
    @columns<br />
  end</p>
<p>end</p>
<p>Of course, it does hit the database, but there is no Merchants table, per se, there is just this model. What returns from a &#039;SELECT * FROM MERCHANTS&#039; is the distinct selection for the value of &#039;merchant&#039; from the Retailers table. These come in from the partners, and they are very consistent. I can&#039;t tell you how helpful this is. The system auto-magically created a Target.com that showed up immediately alongside it&#039;s older bother, Target. Watch out, however, for cache-ing concerns that will necessarily stem from this approach in terms of scale - in this case, that was not a concern because we have a very small (but highly lucrative) user base.</p>
<p>This is the corresponding controller code. This is from the pages_controller, because there is no direct merchants_controller.</p>
<p> 	  def update<br />
 	    @page = Page.find(params[:id])</p>
<p> 	    if @page.update_attributes(params[:page])<br />
 	      if dump_all_merchant_pages(@page.id)<br />
 	        params[:merchants].each do |p|<br />
 	          create_or_update_merchant_page(p[0].to_s, @page.id, true)<br />
 	        end<br />
 	      end<br />
 	      flash[:notice] = &#039;Page was successfully updated.&#039;<br />
 	      redirect_to pages_path<br />
 	    else<br />
 	      render :action =&gt; &#039;edit&#039;<br />
 	    end<br />
 	  end</p>
<p>the functions, from the bottom of the page:</p>
<p> 	private<br />
 	  def dump_all_merchant_pages(page_id)<br />
 	    Page.find(page_id).merchant_pages.each do |x|<br />
 	      x.destroy<br />
 	    end<br />
 	    true<br />
 	  end</p>
<p> 	  def create_or_update_merchant_page(m, p, val)<br />
 	    x = MerchantPage.find_by_sql(["SELECT merchant<br />
                                             FROM merchant_pages<br />
                                            WHERE merchant = ?<br />
                                              AND page_id = ? LIMIT 1", m, p])<br />
 	    if !x.first<br />
 	      x = MerchantPage.new(:merchant =&gt; m, :page_id =&gt; p)<br />
 	      x.save<br />
 	    else<br />
 	      if !val<br />
 	        x.destroy<br />
 	      end<br />
 	      true<br />
 	    end<br />
 	  end</p>
<p>Finally, the _page partial:</p>
<p>form_for ([@page]) do |f|<br />
  Page Name<br />
    f.text_field :title, :size =&gt; 60<br />
    Main Content<br />
    f.text_area :page_body, :cols =&gt; 100<br />
    Locator Footer (Link back to Partner homepage)<br />
    f.text_area :page_footer, :cols =&gt; 100, :rows =&gt; 5<br />
  Merchants<br />
  ul class="Merchant-list"<br />
	  if button_name=="Save Changes"<br />
	    @merchants.each do |m|<br />
	        li INPUT type="checkbox" name="merchants[&lt;=m[0]%&gt;][]" &lt;=m[1]=="1" ? "checked" : "" label m[0].to_s /label<br />
	    end<br />
	  else<br />
	    @merchants.each do |m|<br />
	      li INPUT type="checkbox" name="merchants[&lt;=m&gt;][]"/&gt; &lt;=m.to_s /label<br />
	    end<br />
	  end<br />
    /ul<br />
    f.submit button_name<br />
  end<a href="http://www.digbox.net/index.php/RoR/tableless-models-and-a-checkbox-collecti">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>

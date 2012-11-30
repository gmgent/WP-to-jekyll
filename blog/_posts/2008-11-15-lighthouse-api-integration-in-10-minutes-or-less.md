---
layout: blog
title: Lighthouse API integration in 10 minutes or less
permalink: 2008/11/lighthouse-api-integration-in-10-minutes-or-less
postday: 11/15 2008
posttime: 10_45
categories: [code]
---

<p>As a second part in this series, I am going to talk about Lighthouse for a second. They rock. I built up a calendar app based on their API and the Ruby  <a href="http://digbox.net/index.php/2008/11/15/ruby_calendar_helper_for_dummies">calendar_helper</a>, and it barely took me a day. True story. I ended up using an API token, and I learned a lot about a lib/ based connection object, very interesting.</p>
<p>Here are a few caveats:<br />
Don&#039;t mess with the root class too much. It was not really necessary for most of what I had to do. This is actually one of the cases where it makes sense to load the logic into the controller (a little bit). Plus there isn&#039;t much more meat on the bone, so to speak, the root class covers 100% of a ludicrously simple back-end.<br />
All Lighthouse database objects are not created equal. Tickets are king, and everything else is nothing. I will explain more later - just don&#039;t try to get picky with your call for Milestones. All I have ever been able to do is return a simple dump.</p>
<p>Installation: all I had to do was click through to the <a href="http://github.com/Caged/lighthouse-api/tree/master">GIT repository</a>. From there click lib/, and then lighthouse.rb. Cut and paste the code you see into a lighthouse.rb file in your lib/ folder. Everything you need is right there.</p>
<p>code snippet from my controller action:</p>
<p>    if @project<br />
      #calculate i differential<br />
      month_now = Time.now.month<br />
      year_now = Time.now.year<br />
      i = ((@year - year_now)*12)+ (@month - month_now).abs<br />
      if i == 1<br />
        @tickets = @project.tickets(:q =&gt; "created:&#039;before #{Time.now.day} day#{Time.now.day&gt;1 ? &#039;s&#039; : &#039;&#039;} ago&#039;")<br />
      elsif i &gt; 1<br />
        @tickets = @project.tickets(:q =&gt; "created:&#039;before #{i-1} months ago&#039;")<br />
      else<br />
        @tickets = @project.tickets(:q =&gt; "created:&#039;since 1 month ago&#039;")<br />
      end<br />
      @milestones = @project.milestones(:q =&gt; "due_on:&#039;#{@month}/#{@year}&#039;")<br />
    else<br />
      false<br />
    end</p>
<p>Thankfully, you can get picky with your call for Tickets. That is where the meat of the API is. The text based date searching is pretty cool, because you get a hard limit of 30 rows returned from your query, so you need to be granular enough to catch only what you want.</p>
<p>This is a remote controller action that I use to get info about a particular ticket:</p>
<p>  def ticket_body<br />
    ticket_id = params[:id]<br />
    @project = Lighthouse::Project.find(:first)<br />
    ticket = Lighthouse::Ticket.find ticket_id, :params =&gt; {:project_id =&gt; @project.id}<br />
    out_string = ""<br />
    #counter = 0<br />
    ticket.versions.each do |version|<br />
      this_body = version.body_html<br />
      out_string &lt;&lt; "on #{(version.created_at - (60 * 60 * 8)).strftime("%m/%d at %I:%M%p")} #{get_owner_name(version.user_id)} said: #{this_body ? this_body : "status change"}"<br />
    end<br />
    render :text =&gt; out_string<br />
  end</p>
<p>Notice the 8 hour time differential from UTC code, and that you have to iterate through the ticket.versions to pull out the notes (thanks to Lighthouse help staff for that one).</p>
<p>And then, of course, I have this at the top of my controller:</p>
<p>  def initialize<br />
    Lighthouse.account = &#039;xxx&#039;<br />
    Lighthouse.token = &#039;1111919192384584XXXXXXXXXXX&#039;<br />
    @project = Lighthouse::Project.find(:first)<br />
  end</p>
<p>like I said before, somehow the @project.milestones method won&#039;t take a :q argument, so you&#039;re stuck with just a simple &#039;select *&#039; query for your @milestones recordset. Maybe they will change this soon.</p>

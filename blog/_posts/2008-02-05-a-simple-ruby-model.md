---
layout: blog
title: A simple Ruby model
permalink: 2008/02/a-simple-ruby-model
postday: 02/05 2008
posttime: 07_44
categories: [Code]
---

<p>class Actor &lt; ActiveRecord::Base<br />
  validates_presence_of :name<br />
  validates_uniqueness_of :name<br />
  validates_length_of :name, :maximum =&gt; 26, :message =&gt; "The name you have chosen is too long. You are allowed up to 26 characters."</p>
<p>  belongs_to :user<br />
  REGULAR_LEVEL = 1.004<br />
  RAISED_LEVEL1 = 1.014<br />
  $SAVINGS_QUOTIENT = 2<br />
  WAGES_QUOTIENT = 9</p>
<p>  attr_reader :hasjob</p>
<p>  def exercise!<br />
    self.looks *= REGULAR_LEVEL<br />
  end<br />
  def learn!<br />
    self.skill *= REGULAR_LEVEL<br />
  end<br />
  def lose_burger!<br />
    self.burgers -= 1<br />
  end<br />
  def flirt!<br />
    self.charisma *= REGULAR_LEVEL<br />
  end<br />
  def pavement!<br />
    self.savvy *= RAISED_LEVEL1<br />
  end<br />
  def add_looks!<br />
    self.looks += 1<br />
    lose_point<br />
  end<br />
  def add_charisma!<br />
    self.charisma += 1<br />
    lose_point<br />
  end<br />
  def add_skill!<br />
    self.skill += 1<br />
    lose_point<br />
  end<br />
  def add_savvy!<br />
    self.savvy += 1<br />
    lose_point<br />
  end</p>
<p>  def lose_point<br />
    self.points_to_give -= 1<br />
  end</p>
<p>  def haspoints?<br />
    (self.points_to_give &gt; 0)<br />
  end</p>
<p>  def hasjob?<br />
    (self.works_at&gt;0)<br />
  end</p>
<p>  def has_state?<br />
    @state = State.find_by_user_id(current_user.id)<br />
    defined? @state<br />
  end</p>
<p>  def name_of_job<br />
    Location.find(self.works_at).name<br />
  end</p>
<p>  def gorandom!<br />
    while self.points_to_give &gt; 5<br />
      i = rand(90)<br />
      i %= 5<br />
      if i == 1 then<br />
        self.add_skill!<br />
      end<br />
      if i == 2 then<br />
        self.add_charisma!<br />
      end<br />
      if i == 3 then<br />
        self.add_looks!<br />
      end<br />
      if i == 4 then<br />
        self.add_savvy!<br />
      end<br />
    end<br />
    #self.save<br />
  end<br />
  def calc_savings!<br />
    #call this first<br />
    if self.has_acct &gt; 0 and self.cash &gt; 0<br />
      cash_on_hand = self.cash<br />
      percentage = ($SAVINGS_QUOTIENT*self.has_acct)<br />
      added_cash = ((cash_on_hand*percentage).to_i)/100<br />
      self.cash += added_cash<br />
      "You made $#{added_cash} in interest on your account. "<br />
    else<br />
      ""<br />
    end<br />
  end<br />
  def clear_log!<br />
    self.log = "Ok. "<br />
  end<br />
  def calc_wages!<br />
    if self.has_job &gt; 0<br />
      cash_wages = self.has_job * WAGES_QUOTIENT<br />
      self.cash += cash_wages<br />
      self.consecutive_work_hours += 1<br />
      self.last_pay_date = Time.now<br />
      "You made $#{cash_wages} working at #{Location.find(self.works_at).name}, hour ##{self.consecutive_work_hours}. "<br />
    else<br />
      ""<br />
    end<br />
  end<br />
end<br />
#end class<a href="http://www.digbox.net/index.php/RoR/a-simple-ruby-model">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>

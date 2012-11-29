---
layout: blog
title: A Ruby controller
permalink: 2008/03/a-ruby-controller
postday: 03/01 2008
posttime: 07_49
categories: [code]
---

<p>class GameController &lt; ApplicationController<br />
  scaffold :state<br />
  before_filter :validate, :except =&gt; :create</p>
<p>  def validate<br />
    @state = State.find_by_user_id(current_user.id)<br />
    if @state == nil<br />
      if logged_in?<br />
        flash[:notice] = "Please set up your Rockstar."<br />
        redirect_to(:controller =&gt; &#039;/actor&#039;, :action =&gt; &#039;create&#039;)<br />
      else<br />
        flash[:notice] = "Please Log In."<br />
        redirect_to(:controller =&gt; &#039;home&#039;)<br />
      end<br />
    end<br />
  end</p>
<p>  def create<br />
    #find previous game<br />
    @state = State.new<br />
    @state.user_id = current_user.id<br />
    @state.save<br />
    redirect_to(:action =&gt; &#039;play&#039;)<br />
  end</p>
<p>  def return<br />
    session[:override] = "Welcome back."<br />
    redirect_to(:action =&gt; &#039;play&#039;)<br />
  end</p>
<p>  def list<br />
    @state = State.find_by_user_id(current_user.id)<br />
    if @state == nil<br />
      redirect_to(:controller =&gt; &#039;/account&#039;, :action =&gt; &#039;index&#039;)<br />
    end<br />
    @state_pages, @states = paginate :states, :per_page =&gt; 10<br />
    @thisguy=Actor.find_by_user_id(current_user)<br />
    @location = Location.find(@state.location_id)<br />
  end</p>
<p>  def move<br />
      @state = State.find_by_user_id(current_user.id)<br />
      @thisguy=Actor.find_by_user_id(current_user.id)<br />
      if params[:id] then<br />
        @state.change_location!(params[:id])<br />
      end<br />
      @state.save<br />
      session[:option_name] = ""<br />
      redirect_back_or_default(:action =&gt; &#039;play&#039;)<br />
  end<br />
  def jog<br />
      @state = State.find_by_user_id(current_user.id)<br />
      @thisguy=Actor.find_by_user_id(current_user.id)<br />
      if @state.current_enthusiasm &gt;= 3 then<br />
        @state.lose_enthuse!(3)<br />
        @thisguy.exercise!<br />
        @state.save<br />
        @thisguy.save<br />
      else<br />
        flash[:notice] = "You are too tired to jog."<br />
      end<br />
      #round it by hand<br />
      myfloat = (((@thisguy.looks * 1000).to_i).to_f)/1000<br />
      render_text myfloat.to_s<br />
  end<br />
  def reset_enthusiasm<br />
      @state = State.find_by_user_id(current_user.id)<br />
      @thisguy=Actor.find_by_user_id(current_user.id)<br />
      if @state.current_enthusiasm &lt; 100 then<br />
        @state.reset_enthuse!<br />
        @state.save<br />
        @thisguy.lose_burger!<br />
        @thisguy.save<br />
        render_text @state.current_enthusiasm.to_s<br />
      else<br />
        render_text nil<br />
      end<br />
  end</p>
<p>  def refresh_enthuse<br />
      @state = State.find_by_user_id(current_user.id)<br />
      render_text @state.current_enthusiasm.to_s<br />
  end</p>
<p>  def move_hood<br />
      @state = State.find_by_user_id(current_user.id)<br />
      @thisguy=Actor.find_by_user_id(current_user.id)<br />
      if @state.current_enthusiasm &gt;= 10 then<br />
        @state.lose_enthuse!(10)<br />
        if params[:id] then<br />
          @state.change_hood!(params[:id])<br />
          flash[:notice]="You are tired from the journey."<br />
        end<br />
        session[:option_name] = ""<br />
        @state.save<br />
        @thisguy.save<br />
      else<br />
        flash[:notice]="You are too tired to make it to #{Hood.find(params[:id]).name}. Maybe you should eat a burger."<br />
      end</p>
<p>      redirect_back_or_default(:controller =&gt; &#039;/game&#039;, :action =&gt; &#039;play&#039;)<br />
  end</p>
<p>  def set_option<br />
      @state = State.find_by_user_id(current_user.id)<br />
      @state.set_option!(params[:id])<br />
      @state.save<br />
      session[:option_name] = Option.find(params[:id]).name<br />
      #render_text Option.find(params[:id]).name<br />
      render_text ""<br />
  end</p>
<p>  def busk<br />
      @state = State.find_by_user_id(current_user.id)<br />
      @thisguy=Actor.find_by_user_id(current_user.id)<br />
      if @state.current_enthusiasm &gt;= 3 then<br />
        @state.lose_enthuse!(3)<br />
        @thisguy.learn!<br />
        @state.save<br />
        @thisguy.save<br />
      end<br />
      #round it by hand<br />
      myfloat = (((@thisguy.skill * 1000).to_i).to_f)/1000<br />
      render_text myfloat.to_s<br />
  end</p>
<p>  def flirt<br />
      @state = State.find_by_user_id(current_user.id)<br />
      @thisguy=Actor.find_by_user_id(current_user.id)<br />
      if @state.current_enthusiasm &gt;= 3 then<br />
        @state.lose_enthuse!(3)<br />
        @thisguy.flirt!<br />
        @state.save<br />
        @thisguy.save<br />
      end<br />
      #round it by hand<br />
      myfloat = (((@thisguy.charisma * 1000).to_i).to_f)/1000<br />
      render_text myfloat.to_s<br />
  end</p>
<p>  def pavement<br />
      @state = State.find_by_user_id(current_user.id)<br />
      @thisguy=Actor.find_by_user_id(current_user.id)<br />
      if @state.current_enthusiasm &gt;= 5 then<br />
        @state.lose_enthuse!(5)<br />
        @thisguy.pavement!<br />
        @state.save<br />
        @thisguy.save<br />
      end<br />
      #round it by hand<br />
      myfloat = (((@thisguy.savvy * 1000).to_i).to_f)/1000<br />
      render_text myfloat.to_s<br />
  end</p>
<p>  def play<br />
    if not logged_in? then<br />
      redirect_to(:controller =&gt; &#039;/session&#039;)<br />
    end<br />
    @thisguy=Actor.find_by_user_id(current_user.id)<br />
    if not defined? @thisguy<br />
      redirect_to(:controller =&gt; &#039;/actor&#039;, :action =&gt; &#039;create&#039;)<br />
    end<br />
    session[:option_name] = nil<br />
    @state_pages, @states = paginate :states, :per_page =&gt; 10<br />
    @state = State.find_by_user_id(current_user.id)<br />
    @state.option_id = 999<br />
    @location = Location.find(@state.location_id)<br />
    @hood = Hood.find(@state.hood_id)<br />
    @options = @location.options</p>
<p>  end</p>
<p>  def get_saved_name<br />
    if session[:option_name] == nil then<br />
      render_text ""<br />
    else<br />
      render_text session[:option_name]<br />
    end<br />
  end</p>
<p>  def get_nothing<br />
    render_text " "<br />
  end</p>
<p>  def optin<br />
    @state = State.find_by_user_id(current_user.id)<br />
    if @state.choose_option? then<br />
      @state.process_option!<br />
      flash[:notice] = @state.return_message<br />
      redirect_back_or_default(:controller =&gt; &#039;/game&#039;, :action =&gt; &#039;play&#039;)<br />
    else<br />
      flash[:notice] = @state.return_message<br />
      redirect_back_or_default(:controller =&gt; &#039;/game&#039;, :action =&gt; &#039;play&#039;)<br />
    end<br />
  end</p>
<p>  def option_name<br />
    @state = State.find_by_user_id(current_user.id)<br />
    @option = Option.find_by_id(params[:id])<br />
    render_text @option.name<br />
  end</p>
<p>end</p>
<p><a href="http://www.digbox.net/index.php/RoR/a-ruby-controller">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>

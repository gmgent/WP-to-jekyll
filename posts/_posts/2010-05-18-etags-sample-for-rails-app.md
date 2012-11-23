---
layout: blog
title: etags sample for rails app
permalink: 2010/05/etags-sample-for-rails-app
---

<pre>
def show
  @article = Article.find(params[:id]) 
  
  if stale?(:etag => @article, :last_modified => @article.created_at.utc)
    @statistics = @article.really_expensive_call
    respond_to do |format|
      #etc
    end
  end
end
</pre>

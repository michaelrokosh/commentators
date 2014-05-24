class HomeController < ApplicationController
  require 'will_paginate/array'
  def index
    @recent_images = Image.where(godnota: true)
    @recent_news = News.where(godnota: true)
    @recent_facts = Fact.where(godnota: true)
  	@recent_posts = (@recent_news+@recent_images+@recent_facts).sort_by(&:created_at).reverse
    @recent_posts = @recent_posts.paginate(:page => params[:page], :per_page => 3)
  end

  def dniwe
    @recent_images = Image.where(godnota: false)
    @recent_news = News.where(godnota: false)
    @recent_facts = Fact.where(godnota: false)
    @recent_posts = (@recent_images+@recent_news+@recent_facts).sort_by(&:created_at).reverse
    @recent_posts = @recent_posts.paginate(:page => params[:page], :per_page => 3)
  end

  def best
    @comments = Comment.order('rating DESC').all.paginate(:page => params[:page], :per_page => 3)
  end
end

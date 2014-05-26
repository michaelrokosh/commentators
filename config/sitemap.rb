require 'rubygems'
require 'sitemap_generator'
SitemapGenerator::Sitemap.default_host = 'http://commentators.to'
SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'daily', :priority => 0.9
  add '/dniwe', changefreq: 'weekly'
  add '/best', changefreq: 'weekly'
  add '/users', changefreq: 'weekly'
  News.find_each do |post|
    add news_path(post)
  end
  Fiction.find_each do |post|
    add fiction_path(post)
  end
  Story.find_each do |post|
    add story_path(post)
  end
  Fact.find_each do |post|
    add fact_path(post)
  end
  Image.find_each do |post|
    add image_path(post)
  end
end
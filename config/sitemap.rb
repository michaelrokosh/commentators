require 'rubygems'
require 'sitemap_generator'
SitemapGenerator::Sitemap.default_host = 'http://commentators.to'
SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'daily', :priority => 0.9
  add '/dniwe', changefreq: 'weekly'
  add '/best', changefreq: 'weekly'
  add '/users', changefreq: 'weekly'
end
#!/usr/bin/env ruby

gems = %w{
  rails
  sass
  rake
  bundler
  capistrano
  haml2slim
  jekyll
  middleman
  shotgun
}

gems.each do |gem|
  unless `gem list --local`.include?(gem)
    puts "Installing #{gem}"
    `gem install #{gem} --no-rdoc --no-ri`
  end
end

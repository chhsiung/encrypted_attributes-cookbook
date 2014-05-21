# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://rubygems.org'

group :test, :development do
  gem 'rake'
end

group :test do
  gem 'berkshelf', '~> 2.0'
  gem 'chefspec', '~> 3.2'
  gem 'foodcritic', '~> 3.0'
  gem 'vagrant', github: 'mitchellh/vagrant'
end

group :integration do
  gem 'test-kitchen', '~> 1.2'
  gem 'kitchen-vagrant', '~> 0.10'
end

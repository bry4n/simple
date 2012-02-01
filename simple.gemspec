$:.unshift File.expand_path('../lib', __FILE__)

require "rubygems"
require "simple/version"

Gem::Specification.new do |gem|
  gem.name          = "simple"
  gem.version       = Simple::VERSION
  gem.author        = "Bryan Goines"
  gem.summary       = "Simple lightweight web development framework for Ruby"
  gem.email         = "bryann83@gmail.com"
  gem.homepage      = "http://simplerb.com/"
  gem.files = Dir['**/*']
  # gem.executables = ""
  gem.add_dependency "rack"
  gem.add_dependency "http_router"
end

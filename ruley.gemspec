# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruley/version'

Gem::Specification.new do |s|
  s.name = "ruley"
  s.version = Ruley::VERSION
  s.licenses = 'MIT'

  s.authors = ["Ashish Bista"]
  s.description = "Simple rule engine for ActiveRecord classes"
  s.email = "ashish.bista@nuware.com"

  s.files = `git ls-files`.split("\n").reject { |f| f.match(%r{^(spec)/}) }
  s.files.delete(".gitignore")

  s.require_paths = "lib"
  s.summary = "ActiveRecord rule engine"

  s.add_dependency("activesupport", "~> 4.0")
  s.add_dependency("activerecord", "~> 4.0")

  s.add_development_dependency("rspec",    "~> 3.4")
  s.add_development_dependency("pry")

 end



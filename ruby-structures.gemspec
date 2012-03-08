# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "structures/version"

Gem::Specification.new do |s|
  s.name        = "ruby-structures"
  s.version     = Structures::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James Casey"]
  s.email       = ["jamesc.000@gmail.com"]
  s.homepage    = "https://github.com/jamesc/ruby-structures"
  s.summary     = %q{structures for Ruby}
  s.description = %q{structures for Ruby}

  s.rubyforge_project = "ruby-structures"

  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov", [">= 0.3.8"] #, :require => false

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

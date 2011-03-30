# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "activerecord-lazy"
  s.version     = "0.0.2"
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Jonathan Tropper"
  s.email       = "tropperstyle@gmail.com"
  s.homepage    = "https://github.com/tropperstyle/activerecord-lazy"
  s.summary     = "Lazy create models"
  s.description = "Lazy creation for active record one-to-one associations"

  s.rubyforge_project = "activerecord-lazy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('activerecord', '>= 2.3')
end

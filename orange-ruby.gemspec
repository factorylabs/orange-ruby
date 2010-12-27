# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "orange/ruby/version"

Gem::Specification.new do |s|
  s.name        = "orange-ruby"
  s.version     = Orange::Ruby::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["F/ Interactive"]
  s.email       = ["jay.zeschin@factorylabs.com"]
  s.homepage    = "http://github.com/factorylabs/orange-ruby"
  s.summary     = %q{Rails 3 generators wrapped up in a nice tidy gem}
  s.description = %q{Rails 3 generators wrapped up in a nice tidy gem}
  
  s.add_dependency              "thor"
  s.add_dependency              'rails', '~> 3.0.3'
  s.add_development_dependency  "bundler", "~> 1.0.0"
  s.add_development_dependency  "cucumber"
  s.add_development_dependency  "aruba" 
  s.add_development_dependency  "rspec", "~> 2.3.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

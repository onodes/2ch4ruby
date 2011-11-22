# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "2ch4ruby/version"

Gem::Specification.new do |s|
  s.name        = "2ch4ruby"
  s.version     = 2ch4ruby::VERSION
  s.authors     = ["Daichi ONODERA"]
  s.email       = ["onodes@onod.es"]
  s.homepage    = ""
  s.summary     = %q{2ch for ruby}
  s.description = %q{2ch lib}

  s.rubyforge_project = "2ch4ruby"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

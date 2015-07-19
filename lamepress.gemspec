$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lamepress/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lamepress"
  s.version     = Lamepress::VERSION
  s.authors     = ["mikezaby"]
  s.email       = ["mikezaby@gmail.com"]
  s.homepage    = "ihttps://github.com/mikezaby/lamepress_engine"
  s.summary     = "Lamepress is a Content Managment System for issuing magazines/newspapers."
  s.description = "Lamepress is a Content Managment System for issuing magazines/newspapers."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lamepress/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lamepress"
  s.version     = Lamepress::VERSION
  s.authors     = ["mikezaby"]
  s.email       = ["mikezaby@gmail.com"]
  s.homepage    = "https://github.com/mikezaby/lamepress"
  s.summary     = "Lamepress is a Content Managment System for issuing magazines/newspapers."
  s.description = "Lamepress is a Content Managment System for issuing magazines/newspapers."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2"

  s.add_dependency "ransack"
  s.add_dependency "mysql2", "0.3.17"
  s.add_dependency "devise", "3.4.1"
  s.add_dependency "paperclip"
  s.add_dependency "kaminari"
  s.add_dependency "cancancan"
  s.add_dependency "nokogiri"
  s.add_dependency "ckeditor", "4.1.1"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "fancybox-rails"
  s.add_dependency "handlebars_assets"
end

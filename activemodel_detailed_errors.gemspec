$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "activemodel_detailed_errors/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activemodel_detailed_errors"
  s.version     = ActivemodelDetailedErrors::VERSION
  s.authors     = ["juliogarciag"]
  s.email       = ["julioggonz@gmail.com"]
  s.homepage    = "https://github.com/platanus/activemodel_detailed_errors"
  s.summary     = "errors.details from Rails 5 for Rails 4 people."
  s.description = "errors.details from Rails 5 for Rails 4 people."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2"
end

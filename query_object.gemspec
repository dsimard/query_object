$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "query_object/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "query_object"
  s.version     = QueryObject::VERSION
  s.authors     = ["dsimard"]
  s.email       = ["dsimard@azanka.ca"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of QueryObject."
  s.description = "TODO: Description of QueryObject."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"
  s.add_dependency "request_store"

  s.add_development_dependency "sqlite3"
end

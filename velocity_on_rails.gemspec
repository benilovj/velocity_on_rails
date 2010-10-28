require 'rake'

PKG_FILES = FileList[
  '[a-zA-Z]*',
  'generators/**/*',
  'lib/**/*',
  'rails/**/*',
  'tasks/**/*',
  'test/**/*'
]

Gem::Specification.new do |s|
  s.name = "velocity_on_rails"
  s.version = "0.1"
  s.author = "Jake Benilov"
  s.email = "benilov@gmail.com"
  s.homepage = "http://github.com/benilovj/velocity_on_rails"
  s.platform = Gem::Platform::RUBY
  s.summary = "Rails plugin for using Velocity (http://velocity.apache.org/) templates in your views under JRuby"
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.has_rdoc = false
  s.extra_rdoc_files = ["README"]
end
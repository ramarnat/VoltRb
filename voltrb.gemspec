lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'voltrb/version'

Gem::Specification.new do |s|
  s.name        = "voltrb"
  s.version     = VoltRb::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author     = "Junjun Olympia"
  s.email       = "romeo.olympia@gmail.com"
  s.homepage    = "http://github.com/beljun/voltrb"
  s.summary     = "VoltRb is a gem client for VoltDB."
  s.description = "VoltRb is a gem client for VoltDB that uses it's JSON interface. Works with VoltDB v1.1 onwards."

  s.rubyforge_project = "voltrb"

  s.add_dependency "json"
  s.add_dependency "rest-client"

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("{lib}/**/*") + %w(README MIT-LICENSE CHANGELOG)
  s.require_path = 'lib'
end


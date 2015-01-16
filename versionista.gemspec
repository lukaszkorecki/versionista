# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'versionista'

Gem::Specification.new do |spec|
  spec.name          = 'versionista'
  spec.version       = Versionista::VERSION
  spec.authors       = ['Łukasz Korecki']
  spec.email         = ['lukasz@korecki.me']
  spec.summary       = 'Simple VERSION file manager.'
  spec.description   = 'No fuss and extra features. Simply bump major/minor/patch version of your software stored in VERSION file. You can create it too'
  spec.homepage      = 'https://github.com/lukaszkorecki/versionista'
  spec.license       = 'MIT'
  spec.required_ruby_version = '~> 2.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end

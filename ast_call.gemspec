# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ast_call/version'

Gem::Specification.new do |spec|
  spec.name          = 'ast_call'
  spec.version       = AstCall::VERSION
  spec.authors       = ['Romain Tartière']
  spec.email         = ['romain@blogreen.org']
  spec.summary       = %q{Originate calls through Asterisk AMI.}
  spec.homepage      = 'https://github.com/sante-link/ast_call'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_dependency 'ruby-asterisk', '~> 0.1.0'
end

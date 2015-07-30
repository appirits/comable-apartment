lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'comable/apartment/version'

Gem::Specification.new do |spec|
  spec.name          = 'comable-apartment'
  spec.version       = Comable::Apartment::VERSION
  spec.authors       = ['YOSHIDA Hiroki']
  spec.email         = ['hyoshida@appirits.com']
  spec.summary       = 'Multi-tenancy with Comable'
  spec.description   = 'Multi-tenancy with Comable using the Apartment gem'
  spec.homepage      = 'https://github.com/appirits/comable-apartment'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'apartment', '~> 1.0.1'
  spec.add_dependency 'comable-core', '~> 0.6.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.7.0'
  spec.add_development_dependency 'minitest-reporters', '~> 1.0.19'
  spec.add_development_dependency 'shoulda', '~> 3.5.0'
  spec.add_development_dependency 'factory_girl_rails', '~> 4.5.0'
  spec.add_development_dependency 'pg'
end

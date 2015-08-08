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
  spec.add_dependency 'slim-rails', '~> 3.0.1'
  spec.add_dependency 'sass-rails' # TODO: '~> 5.0.1'
  spec.add_dependency 'coffee-rails', '>= 3.2.2', '< 4.2'
  spec.add_dependency 'compass-rails', '~> 2.0.4'
  spec.add_dependency 'uglifier', '~> 2.7.0'
  spec.add_dependency 'bootstrap-sass', '~> 3.3.3'
  spec.add_dependency 'font-awesome-rails', '~> 4.3.0.0'
  spec.add_dependency 'dynamic_form', '~> 1.1.4'
  spec.add_dependency 'jquery-rails', '~> 3.1.2', '< 4.1'
  spec.add_dependency 'jquery-ui-rails', '~> 5.0.3'
  spec.add_dependency 'raphael-rails', '~> 2.1.2'
  spec.add_dependency 'morrisjs-rails', '~> 0.5.1'
  spec.add_dependency 'nprogress-rails', '~> 0.1.6.7'
  spec.add_dependency 'turbolinks', '~> 2.5.3'
  spec.add_dependency 'jquery-turbolinks', '~> 2.1.0'
  spec.add_dependency 'awesome_admin_layout', '~> 0.1.1'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'shoulda'
  spec.add_development_dependency 'factory_girl_rails'
  spec.add_development_dependency 'pg'
end

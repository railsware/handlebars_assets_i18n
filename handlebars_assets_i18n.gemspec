# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "handlebars_assets_i18n"
  spec.version       = "0.1"
  spec.authors       = ["Andriy Yanko"]
  spec.email         = ["andriy.yanko@gmail.com"]
  spec.summary       = %q{handlebars assets simple internationalization}
  spec.homepage      = "https://github.com/railsware/handlebars_assets_i18n"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency 'handlebars_assets', '>=0.13.0'
  spec.add_runtime_dependency 'i18n', '>= 0.6.9'
end

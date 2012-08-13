# -*- encoding: utf-8 -*-
require File.expand_path('../lib/twitter_bootstrap_builder/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gabriel Naiman"]
  gem.email         = ["gabynaiman@gmail.com"]
  gem.description   = 'Set of helpers to extend Rails for implement Twitter Bootstrap markup'
  gem.summary       = 'Set of helpers to extend Rails for implement Twitter Bootstrap markup'
  gem.homepage      = "https://github.com/gabynaiman/twitter_bootstrap_builder"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "twitter_bootstrap_builder"
  gem.require_paths = ["lib"]
  gem.version       = TwitterBootstrapBuilder::VERSION

  gem.add_dependency 'twitter_bootstrap_markup'
end

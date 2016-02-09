# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tumblr_uploadr/constants'

Gem::Specification.new do |spec|
  spec.name          = TumblrUploadr::PRODUCT
  spec.version       = TumblrUploadr::VERSION
  spec.authors       = ['dkhamsing']
  spec.email         = ['dkhamsing8@gmail.com']

  spec.summary       = TumblrUploadr::PRODUCT_DESCRIPTION
  spec.description   = TumblrUploadr::PRODUCT_DESCRIPTION
  spec.homepage      = TumblrUploadr::PRODUCT_URL

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = [TumblrUploadr::PRODUCT]
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'tumblr_client', '~> 0.8.5'
end

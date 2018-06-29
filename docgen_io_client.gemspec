# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docgen_io_client/version'

Gem::Specification.new do |spec|
  spec.name          = "docgen_io_client"
  spec.version       = DocgenIoClient::VERSION
  spec.authors       = ["Nicholas Stock"]
  spec.email         = ["nick@gembani.com"]

  spec.summary       = %q{Client library for docgen.io service}
  spec.description   = %q{Docgen enables templated latex to pdf generation on the fly}
  spec.homepage      = "https://www.gembani.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "activesupport", "~> 5.0"
  spec.add_dependency "rest-client", "~> 2.0.1"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "dotenv", "~> 2.2.0 "
  spec.add_development_dependency "byebug"


  spec.add_development_dependency "rspec", "~> 3.0"
end

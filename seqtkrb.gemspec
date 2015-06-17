# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seqtkrb/version'

Gem::Specification.new do |spec|
  spec.name          = "seqtkrb"
  spec.version       = Seqtkrb::VERSION
  spec.authors       = ["Richard Smith-Unna"]
  spec.email         = ["richardsmith404@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{ Fast processing of FASTA/FASTQ files }
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'bindeps'
  spec.add_dependency 'fixwhich'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'test-unit', '~> 3.0'
  spec.add_development_dependency 'turn', '~> 0.9', '>= 0.9.7'
  spec.add_development_dependency 'minitest', '~> 4', '>= 4.7.5'
  spec.add_development_dependency 'simplecov', '~> 0.8', '>= 0.8.2'
  spec.add_development_dependency 'shoulda', '~> 3.5', '>= 3.5.0'
  spec.add_development_dependency 'coveralls', '~> 0.7', '>= 0.7.2'
end

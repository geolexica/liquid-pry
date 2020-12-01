require_relative 'lib/jekyll/pry/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-pry"
  spec.version       = Jekyll::Pry::VERSION
  spec.authors       = ["Ribose Inc."]
  spec.email         = ["open.source@ribose.com"]

  spec.summary       = "Brings Pry to Liquid templates."
  spec.homepage      = "https://github.com/riboseinc/jekyll-pry"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  all_files_in_git = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0")
  end

  spec.files         = all_files_in_git.reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = all_files_in_git.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("jekyll")
  spec.add_runtime_dependency("pry")
end

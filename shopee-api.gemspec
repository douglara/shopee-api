require_relative "lib/shopee/version"

Gem::Specification.new do |spec|
  spec.name = "shopee-api"
  spec.version = Shopee::VERSION
  spec.authors = ["Douglas Lara"]
  spec.email = ["douglasdelaras@gmail.com"]

  spec.summary = %q{Simple Gem to integrate with Shopee.}
  spec.homepage = "https://github.com/douglara/shopee-api"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "dotenv-rails"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_runtime_dependency "httparty", "~> 0.18.1"
end

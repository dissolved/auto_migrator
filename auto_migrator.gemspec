# frozen_string_literal: true

require_relative "lib/auto_migrator/version"

Gem::Specification.new do |spec|
  spec.name = "auto_migrator"
  spec.version = AutoMigrator::VERSION
  spec.authors = ["Ryan Sandridge"]
  spec.email = ["noreply@ryansandridge.com"]

  spec.summary = "Git hooks to manage keep your Rails codebase and database in sync during development."
  spec.description = <<~DESCRIPTION
    These hooks will let you know when you switch to a git branch where the database schema is out of sync with the
    schema on the branch you were previously working on.
  DESCRIPTION
  spec.homepage = "https://github.com/dissolved/auto_migrator"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.6"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/dissolved/auto_migrator/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "rspec", "~> 3.12.0"
  spec.add_development_dependency "rubocop", "~> 1.50.2"
  spec.add_development_dependency "rake", "~> 13.0.6"
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

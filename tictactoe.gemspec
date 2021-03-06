# frozen_string_literal: true

require_relative "lib/tictactoe/version"

Gem::Specification.new do |spec|
  spec.name = "tictactoe"
  spec.version = Tictactoe::VERSION
  spec.authors = ["Mickaël Pham"]
  spec.email = ["inbox@mickael.dev"]

  spec.summary = "Playing a childhood game"
  spec.homepage = "https://github.com/mickaelpham/tictactoe"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sinatra", "~> 2"
  spec.add_dependency "zeitwerk", "~> 2"
end

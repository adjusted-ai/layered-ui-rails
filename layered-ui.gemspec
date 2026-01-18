require_relative "lib/layered/ui/version"

Gem::Specification.new do |spec|
  spec.name        = "layered-ui"
  spec.version     = Layered::Ui::VERSION
  spec.authors     = ["layered.ai"]
  spec.summary     = "Foundational responsive UI system for Rails applications with light and dark theme support"
  spec.homepage    = "https://www.layered.ai"
  spec.license     = "Apache-2.0"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,lib}/**/*", "Gemfile"]
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 8.0"
  spec.add_dependency "tailwindcss-rails", ">= 4.0"
end

# frozen_string_literal: true

require_relative "lib/ares/version"

Gem::Specification.new do |specification|
    specification.name          = "ares"
    specification.version       = ARES::VERSION
    specification.authors       = ["Artem Eremeev", "Mikhail Eremeev"]
    specification.email         = ["jeremy1002@yandex.ru", ""]

    specification.summary       = "Apple Resources generator"
    specification.description   = "ARES is Apple Resources generator for ios projects in \"LLC Pure Native\""
    specification.homepage      = "https://github.com/purenative/ares"
    specification.license       = "MIT"
    specification.required_ruby_version = ">= 2.6"

    specification.bindir        = "exe"
    specification.executables   << "ares"

    specification.files         = Dir["lib/**/*.rb", "swifttemplates/*.swifttemplate"]
end

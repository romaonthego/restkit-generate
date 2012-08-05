Gem::Specification.new do |s|
  s.name = "restkit-generate"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roman Efimov"]
  s.date = %q{2012-08-04}
  s.default_executable = %q{restkit-generate}
  s.description = %q{A model generator for iOS RestKit (Rails-like)}
  s.email = %q{romefimov@gmail.com}
  s.executables = ["restkit-generate"]
  s.files = [
    "bin/restkit-generate",
    "lib/generator.rb",
    "lib/generator/common.rb",
    "lib/generator/header.rb",
    "lib/generator/mk.rb"
  ]
  s.homepage = %q{https://github.com/romaonthego}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A model generator for iOS RestKit (Rails-like), ARC compliant}
end


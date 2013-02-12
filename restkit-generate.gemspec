Gem::Specification.new do |s|
  s.name = "restkit-generate"
  s.version = "0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roman Efimov"]
  s.date = %q{2013-02-13}
  s.default_executable = %q{restkit-generate}
  s.description = %q{A model generator for iOS RestKit (Rails-like)}
  s.email = %q{romefimov@gmail.com}
  s.executables = ["restkit-generate"]
  s.files = [
    "bin/restkit-generate",
    "lib/restkit-generate.rb",
    "lib/restkit-generate/common.rb",
    "lib/restkit-generate/h.rb",
    "lib/restkit-generate/m.rb",
    "lib/restkit-generate/nsmanagedobject.h.erb",
    "lib/restkit-generate/nsmanagedobject.m.erb",
    "lib/restkit-generate/nsobject.h.erb",
    "lib/restkit-generate/nsobject.m.erb"
  ]
  s.homepage = %q{https://github.com/romaonthego}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A model generator for iOS RestKit (Rails-like), ARC compliant}
end


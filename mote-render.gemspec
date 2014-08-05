Gem::Specification.new do |s|
  s.name = "mote-render"
  s.version = "1.1.0"
  s.summary = "Mote plugin for Cuba."
  s.description = s.summary
  s.authors = ["Cyril David", "Francesco Rodríguez", "Mayn Kjær"]
  s.email = ["frodsan@me.com", "mayn.kjaer@gmail.com"]
  s.homepage = "https://github.com/frodsan/mote-render"
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")

  s.add_development_dependency "mote"
  s.add_development_dependency "cuba"
  s.add_development_dependency "cutest"
end

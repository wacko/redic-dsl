# encoding: utf-8

Gem::Specification.new do |s|
  s.name              = "redic-dsl"
  s.version           = "0.0.1"
  s.summary           = "DSL wrapper for Redic"
  s.description       = "Add some DSL around redic, a lightweight Redis client"
  s.author            = "Joaquín Vicente"
  s.email             = "joakin@gmail.com"
  s.homepage          = "https://github.com/wacko/redic-dsl"
  s.license           = "MIT"

  s.files             = `git ls-files`.split("\n")

  s.add_dependency "redic", '~> 0'
  s.add_development_dependency "cutest", '~> 0'
end

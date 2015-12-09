require_relative "lib/admesh/version"

Gem::Specification.new do |s|
  s.name        = "ruby-admesh"
  s.summary     = "Ruby wrapper gem for the Admesh library"
  s.description = "Ruby wrapper gem for the Admesh library"
  s.authors     = ["Martijn Versluis"]
  s.email       = "martijn@youmagine.com"
  s.homepage    = "https://github.com/Ultimaker/ruby-admesh"

  s.version     = Admesh::VERSION
  s.files       = ["lib/admesh.rb"]
  s.extensions = ["ext/admesh/extconf.rb"]
end

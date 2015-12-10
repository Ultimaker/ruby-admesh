require_relative "lib/admesh"

Gem::Specification.new do |s|
  s.name        = "admesh"
  s.summary     = "Ruby wrapper gem for the Admesh library"
  s.description = "The ruby-admesh gem wraps the Admesh STL mesh manipulation tool CLI in a Ruby "\
                  "gem. It has the Admesh software packaged, so installation of Admesh it not "\
                  "necessary."
  s.authors     = ["Martijn Versluis"]
  s.email       = "martijn@youmagine.com"
  s.homepage    = "https://github.com/Ultimaker/ruby-admesh"
  s.licenses    = ["gpl"]

  s.version     = Admesh::VERSION
  s.files       = Dir["lib/*.rb"] + Dir["ext/**/*"]
  s.extensions  = ["ext/admesh/extconf.rb"]
end

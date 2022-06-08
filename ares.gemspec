Gem::Specification.new do |specification|
    specification.name          = 'ares'
    specification.version       = '0.0.15'
    specification.summary       = 'Apple Resources generator'
    specification.executables   << 'ares'
    specification.description   = 'ARES is Apple Resources generator for ios projects in "LLC Pure Native"'
    specification.authors       = ['Artem Eremeev']
    specification.email         = 'jeremy1002@yandex.ru'
    specification.files         = Dir['lib/*.rb'] + Dir['lib/*.swifttemplate']
    specification.homepage      = 'https://rubygems.org/gems/ipec'
    specification.license       = 'MIT'
end
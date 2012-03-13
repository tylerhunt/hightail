require './lib/hightail/version'

Gem::Specification.new do |s|
  s.name = 'hightail'
  s.version = Hightail::VERSION
  s.authors = ['Tyler Hunt']
  s.email = ['tyler@tylerhunt.com']
  s.summary = 'Bootstraps a pretty looking Rails app in a jiff.'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency('rails', '~> 3.0')
  s.add_dependency('bundler', '~> 1.0')
end

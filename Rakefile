require 'rubygems/package_task'
require 'rake'
require 'rake/testtask'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'ruby-ares'

gemspec = eval(File.open(File.join(File.dirname(__FILE__),'ruby-ares.gemspec')).read)

Gem::PackageTask.new gemspec do |pkg|
end

Rake::TestTask.new('test') do |t|
  t.libs << 'test'
  t.pattern = 'test/**/test*.rb'
  t.verbose = true
end

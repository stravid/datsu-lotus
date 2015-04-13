require 'rake'
require 'rake/testtask'

Rake.add_rakelib 'lib/tasks'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/test_*.rb'
  t.libs    << 'test'
end

task default: :test

task :environment do
  require_relative './config/environment'
  Lotus::Application.preload!
end

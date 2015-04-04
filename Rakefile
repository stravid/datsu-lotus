require 'rake'
require 'rake/testtask'

Rake.add_rakelib 'lib/tasks'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

task default: :test
task spec: :test

task :environment do
  require_relative './config/environment'
  Lotus::Application.preload!
end

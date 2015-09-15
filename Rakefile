require 'bundler/gem_tasks'
require 'rake/testtask'

Dir.glob('lib/comable/apartment/tasks/*.rake').each { |r| load r }

APP_RAKEFILE = File.expand_path('../test/dummy/Rakefile', __FILE__)
load 'rails/tasks/engine.rake'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end

description = Rake::Task[:release].comment
Rake::Task[:release].clear
desc description
task release: 'comable:apartment:release'

task default: :test

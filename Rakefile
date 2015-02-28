require 'rake/testtask'

desc "Run specs"
Rake::TestTask.new do |t|
    t.libs << "spec"
    t.pattern = "spec/**/*_spec.rb"
end

desc "Run specs (default)"
task :default => :test
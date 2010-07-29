require 'rubygems'
require 'rake'

require 'rake/clean'

CLEAN.include FileList[
  "test/volt_test_db/*.jar", 
  "test/volt_test_db/*.class", 
  "test/volt_test_db/plannerlog.txt", 
  "test/volt_test_db/debugoutput"]

# = RSpec

require 'spec/rake/spectask'

desc "Test VoltRb"
task :test do
  puts "This test suite requires that the included test Volt database is running."
  puts "Please ensure that the environment variable CLASSPATH includes the path to the VoltDB installation."
  puts "In one command line window, type: rake test:start_db"
  puts "Then in another window, type: rake test:all"
end

namespace :test do
  desc "Compile and start the test Volt database."
  task :start_db do
    volt_path = ENV["CLASSPATH"].split(':').find { |e| e =~ /voltdb\/\*/ }
    puts "Error: Unable to find the VoltDb path in the environment variable: $CLASSPATH" unless volt_path
    volt_lib = volt_path.gsub(/\*/, '')
    sh("pwd")
    Dir.chdir('test/volt_test_db')
    puts "Compiling stored procedures."
    sh("javac *java")
    puts "Compiling application catalog."
    sh("java org.voltdb.compiler.VoltCompiler project.xml test_db.jar")
    puts "Creating and launching database. Press Control-C to stop."
    sh("java -Djava.library.path=#{volt_lib} org.voltdb.VoltDB catalog test_db.jar deployment deployment.xml")
    Dir.chdir('../..')
  end

  desc "Run all specs"
  Spec::Rake::SpecTask.new('all') do |t|
    t.spec_opts = ['--colour --format progress --loadby mtime --reverse']
    t.spec_files = FileList['test/spec_*.rb']
  end
end

# = RDoc 

require 'rake/rdoctask'

Rake::RDocTask.new do |t|
  t.rdoc_dir = 'rdoc'
  t.title    = "VoltRb: A gem client for VoltDB"
  t.options << '--line-numbers' << '--inline-source' << '-A cattr_accessor=object'
  t.options << '--charset' << 'utf-8'
  t.rdoc_files.include('README', 'MIT-LICENSE', 'lib/**/*.rb')
end

# == Gem Management

require 'rake/gempackagetask'

def gemspec
  @gemspec ||= begin
    file = File.expand_path('../voltrb.gemspec', __FILE__)
    eval(File.read(file), binding, file)
  end
end

Rake::GemPackageTask.new(gemspec) do |pkg|
    pkg.gem_spec = gemspec
end

task :gem => :gemspec

desc "install the gem locally"
task :install => :package do
  sh %{gem install pkg/#{gemspec.name}-#{gemspec.version}}
end

desc "validate the gemspec"
task :gemspec do
  gemspec.validate
end

task :package => :gemspec


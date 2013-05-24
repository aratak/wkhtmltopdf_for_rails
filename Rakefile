#!/usr/bin/env rake
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rake/testtask'

task :clean do
  sh "rm -rf pkg"
  sh "rm -rf bin"
end

def get_binary_gemspec(platform = RUBY_PLATFORM)
  gemspec = eval(File.read('wkhtmltopdf_for_rails.gemspec'))
  gemspec.platform = Gem::Platform.new(platform)
  gemspec
end

begin
  binary_gem_name = File.basename get_binary_gemspec.cache_file
rescue
  binary_gem_name = ''
end

desc "build a binary gem #{binary_gem_name}"
task :binary do
  gemspec = get_binary_gemspec
  gemspec.files += ['bin/wkhtmltopdf']

  FileUtils.mkdir_p 'pkg'
  FileUtils.mkdir_p 'bin'

  FileUtils.cp "ext/wkhtmltopdf/wkhtmltopdf_#{gemspec.platform.os}", "bin/wkhtmltopdf"

  package = if Gem::VERSION < '2.0.0'
    Gem::Builder.new(gemspec).build
  else
    require 'rubygems/package'
    Gem::Package.build(gemspec)
  end

  FileUtils.mv(package, 'pkg')
  FileUtils.remove_dir('bin')
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*.rb']
  t.verbose = true
end

desc "Run tests"
task :default => :test

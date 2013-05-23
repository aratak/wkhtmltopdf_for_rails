#!/usr/bin/env rake
require 'bundler/setup'
require "bundler/gem_tasks"

task :clean do
  sh "rm -rf pkg"
end

NativeGem = "pkg/wkhtmltopdf_for_rails-#{WkhtmltopdfForRails::VERSION}-#{Gem::Platform.new(RUBY_PLATFORM)}.gem"
file NativeGem => :build do
  #require "rubygems/compiler"
  #compiler = Gem::Compiler.new("pkg/therubyracer-#{V8::VERSION}.gem", 'pkg')
  #compiler.compile
  p "build starts here"
  compiler = Gem::Compiler.new("pkg/wkhtmltopdf_for_rails-#{WkhtmltopdfForRails::VERSION}.gem", 'pkg')
  compiler.compile
end

desc "Build #{NativeGem} into the pkg directory"
task "build:native" => NativeGem

desc "Build and install #{File.basename NativeGem} into system gems"
task "install:native" => "build:native" do
  sh "gem install #{NativeGem}"
end

desc "Validate the gemspec"
task :gemspec do
  gemspec.validate
end

task :default => :spec

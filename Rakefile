#!/usr/bin/env rake
require 'bundler/setup'
require "bundler/gem_tasks"

task :clean do
  sh "rm -rf pkg"
end

def get_binary_gemspec(platform = RUBY_PLATFORM)
  gemspec = eval(File.read('wkhtmltopdf_for_rails.gemspec'))
  gemspec.platform = Gem::Platform.new(platform)
  gemspec
end

#binary_gem_name = "pkg/wkhtmltopdf_for_rails-#{WkhtmltopdfForRails::VERSION}-#{Gem::Platform::CURRENT}.gem"

begin
  binary_gem_name = File.basename get_binary_gemspec.cache_file
rescue
  binary_gem_name = ''
end

desc "build a binary gem #{binary_gem_name}"
task :binary do
  gemspec = get_binary_gemspec
  # We don't need most things for the binary
  gemspec.files = []
  gemspec.files += ['lib/libv8.rb', 'lib/libv8/version.rb']
  gemspec.files += ['ext/libv8/arch.rb', 'ext/libv8/location.rb', 'ext/libv8/paths.rb']
  gemspec.files += ['ext/libv8/.location.yml']
  # V8
  gemspec.files += Dir['vendor/v8/include/*']
  gemspec.files += Dir['vendor/v8/out/**/*.a']
  FileUtils.chmod 'a+r', gemspec.files
  FileUtils.mkdir_p 'pkg'
  package = if Gem::VERSION < '2.0.0'
    Gem::Builder.new(gemspec).build
  else
    require 'rubygems/package'
    Gem::Package.build(gemspec)
  end
  FileUtils.mv(package, 'pkg')
end

task :debug do
  p get_binary_gemspec.files
end

task :default => :spec

require 'rubygems'
require 'rubygems/command.rb'

begin
  Gem::Command.build_args = ARGV
rescue NoMethodError
end

def get_binary_gemspec(platform = RUBY_PLATFORM)
  eval(File.read('wkhtmltopdf_for_rails.gemspec'))
end

gemspec = get_binary_gemspec
FileUtils.mkdir_p 'bin'
FileUtils.cp "ext/wkhtmltopdf/wkhtmltopdf_#{gemspec.platform.os}", "bin/wkhtmltopdf"

f = File.open(File.join(File.dirname(__FILE__), "Rakefile"), "w")   # create dummy rakefile to indicate success
f.write("task :default\n")
f.close

require 'rubygems'
require 'rubygems/command.rb'
require 'fileutils'
require 'rbconfig'

begin
  Gem::Command.build_args = ARGV
rescue NoMethodError
end

platform = RbConfig::CONFIG['host_os']
cpu = RbConfig::CONFIG['host_cpu']

if platform =~ /linux/ && cpu =~ /[3|4]86/
  executable = 'wkhtmltopdf_linux'
elsif platform =~ /linux/ && cpu =~ /64/
  executable = 'wkhtmltopdf_amd64'
elsif platform =~ /darwin/
  executable = 'wkhtmltopdf_darwin'
else
  raise "Invalid platform. Must be running linux or intel-based Mac OS."
end

FileUtils.mkdir_p '../bin'
FileUtils.cp "wkhtmltopdf/#{executable}", "../bin/wkhtmltopdf"

f = File.open(File.join(File.dirname(__FILE__), "Rakefile"), "w")   # create dummy rakefile to indicate success
f.write("task :default\n")
f.close

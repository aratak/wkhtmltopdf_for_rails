# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wkhtmltopdf_for_rails/version'

Gem::Specification.new do |s|
  s.name = %q{wkhtmltopdf_for_rails}
  s.version = WkhtmltopdfForRails::VERSION
  s.authors = ["Alexey Osipenko"]
  s.date = %q{2010-04-29}
  s.description = %q{Provides WKHTMLTOPDF for ruby on rails.}
  s.email = %q{alexey@osipenko.in.ua}
  s.files  = `git ls-files`.split("\n")
  s.test_files = [
    "test/test_helper.rb",
    "test/wkhtmltopdf_test.rb",
    "test/wkhtmltopdf_test_controller_test.rb"
  ]
  s.homepage = %q{http://github.com/aratak/wkhtmltopdf_for_rails}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.summary = %q{Provides WKHTMLTOPDF for ruby on rails.}
  s.extensions = 'ext/mkrf_conf.rb'
end


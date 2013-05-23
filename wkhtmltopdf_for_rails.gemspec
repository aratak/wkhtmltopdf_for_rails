# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wkhtmltopdf_for_rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name = %q{wkhtmltopdf_for_rails}
  s.version = WkhtmltopdfForRails::VERSION
  s.authors = ["Alexey Osipenko"]
  s.date = %q{2010-04-29}
  s.description = %q{Provides WKHTMLTOPDF for ruby on rails.}
  s.email = %q{alexey@osipenko.in.ua}
  s.files  = `git ls-files`.split("\n")
  s.extra_rdoc_files = [
    "README"
  ]
  s.test_files = [
    "test/test_helper.rb",
    "test/wkhtmltopdf_test.rb",
    "test/wkhtmltopdf_test_controller_test.rb"
  ]
  s.homepage = %q{http://github.com/aratak/wkhtmltopdf_for_rails}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.summary = %q{Provides WKHTMLTOPDF for ruby on rails.}
  s.add_development_dependency 'gem-compiler'

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end


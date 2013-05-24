require 'wkhtmltopdf_for_rails/render_pdf'
require 'wkhtmltopdf_for_rails/wkhtmltopdf'

Mime::Type.register 'application/pdf', :pdf unless Mime[:pdf]

ActionController::Base.send(:include, WkhtmltopdfForRails::RenderPdf)

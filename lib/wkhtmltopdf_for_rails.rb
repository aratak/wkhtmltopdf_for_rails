require 'render_pdf'
require 'wkhtmltopdf'

Mime::Type.register 'application/pdf', :pdf unless Mime[:pdf]

ActionController::Base.send(:include, RenderPdf)

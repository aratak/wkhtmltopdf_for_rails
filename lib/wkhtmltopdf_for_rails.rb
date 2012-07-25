require 'render_pdf'
require 'wkhtmltopdf'

ActionController::Base.send(:include, RenderPdf)

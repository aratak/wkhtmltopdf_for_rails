module RenderPdf
  def render_to_pdf(options = {})
    send_data(
      make_pdf(options),
      :filename => "#{options[:pdf]}.pdf",
      :type  => 'application/pdf'
    )
  end
  
  private
  
  def make_pdf(options)
    if options.has_key?(:template)
      html_string = generate_html(options)
      file = Tempfile.new([options[:pdf], '.html'])
      file.write(html_string)
      file.close
      options[:html_file] = file.path
    end

    pdf = Wkhtmltopdf.new(options)
    pdf.generate
  ensure
    file.unlink if file
  end
  
  def generate_html(options)
    render_options = {}
    render_options[:template] = options.delete(:template)
    render_options[:layout] = options.delete(:layout) if options.has_key?(:layout)
    
    html_string = render_to_string(render_options).to_str
    
    # re-route absolute paths for images, scripts and stylesheets
    html_string.gsub!( /src=["']+([^:]+?)["']/i ) { |m| "src=\"#{::Rails.root}/public" + $1 + '"' }
    html_string.gsub!( /<link href=["']+([^:]+?)["']/i ) { |m| "<link href=\"#{::Rails.root}/public" + $1 + '"' }
    
    # Remove asset ids on images, scripts, and stylesheets with a regex
    html_string.gsub!( /src=["'](\S+\?\d*)["']/i ) { |m| 'src="' + $1.split('?').first + '"' }
    html_string.gsub!( /<link href=["'](\S+\?\d*)["']/i ) { |m| '<link href="' + $1.split('?').first + '"' }
    
    return html_string.html_safe
  end
end

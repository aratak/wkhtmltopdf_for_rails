module WkhtmltopdfForRails
  class Wkhtmltopdf
    attr_accessor :pdf_file, :html_file, :source, :optional_params, :params_string

    def initialize(options)
      @html_file = options[:html_file] if options.has_key?(:html_file)
      @source = options[:source] if options.has_key?(:source)
      @optional_params = options[:wkhtmltopdf_options] if options.has_key?(:wkhtmltopdf_options)
      create_params_string
    end

    def generate
      wkhtml_call = File.join(File.dirname(__FILE__), "..", "..", "bin", "wkhtmltopdf ")

      if !@source.nil?
        wkhtml_call << "#{@source}"
      else
        wkhtml_call << "#{@html_file}"
      end
      wkhtml_call << " #{@params_string} - -q"
      IO.popen(wkhtml_call, "rb").read
    end

    private

    def create_params_string
      params_arr = []
      unless @optional_params.nil?
        @optional_params.each do |key, val|
          if val && val.is_a?(String)
            params_arr << "--#{key.to_s} '#{val}'"
          elsif val
            params_arr << "--#{key.to_s}"
          end
        end
      end
      @params_string = params_arr.join(' ')
    end
  end
end

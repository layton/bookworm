module BookWorm
  class Search
    attr_accessor :options, :results, :type
    
    def self.config
      @config
    end
    
    def self.config=(config)
      @config = config
    end

    def initialize(type, options)
      self.type = type
      self.options = options
    end
    
    def books
      query.search('BookData').map { |node| Book.new(node) }
    end
    
    def config
      self.class.config
    end
    
    def query
      xml_data = Net::HTTP.get_response(URI.parse(url)).body
      Nokogiri::XML(xml_data)
    end
    
    def results
      self.send(type)
    end

    def url
      host = config[:host] || 'isbndb.com'
      
      url_options = options.dup

      params = {
        :access_key => config[:access_key],
        :results => url_options.delete(:results)
      }
      
      index = 1
      url_options.each do |k, v|
        params["index#{index}"] = k
        params["value#{index}"] = v
        index += 1
      end
      
      query_string = params.map { |k, v| "#{k}=#{v}" }.join('&')

      "http://#{host}/api/#{type}.xml?#{query_string}"
    end
  end
end
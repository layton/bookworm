module BookWorm
  class Publisher
    attr_accessor :city, :name, :year
    
    def self.parse(publisher_text)
      BookWorm::Publisher.new(publisher_text) if publisher_text
    end
    
    def initialize(publisher_text)
      parse(publisher_text)
    end
    
    def parse(publisher_text)
      if match = publisher_text.match(/([\w\s]+\:)?([\w\. ]+)?(,[\w\ ]+)?/)
        self.city, self.name, self.year = match.captures
        self.city.gsub!(':', '') if self.city
        self.name.strip! if self.name
        self.year.gsub!(', c', '') if self.year
      end
    end
  end
end
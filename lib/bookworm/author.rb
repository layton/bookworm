module BookWorm
  class Author
    attr_accessor :first_name, :middle_name, :last_name
    
    def self.parse(author_names)
      author_names.split(',').map { |txt| BookWorm::Author.new(txt) }
    end

    def initialize(full_name)
      parse(full_name)
    end

    def parse(full_name)
      parts = full_name.split(' ')
      if parts.size == 2
        self.first_name, self.last_name = parts
      elsif parts.size == 3
        self.first_name, self.middle_name, self.last_name = parts
      end
    end
  end
end
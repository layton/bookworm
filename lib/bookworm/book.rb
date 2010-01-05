module BookWorm
  class Book
    attr_accessor :authors, :isbn, :publisher, :title
    
    def initialize(node)
      self.isbn = node['isbn'] || node['isbn13']
      if title_node = node.search('Title').first
        self.title = title_node.content
      end
      if authors_node = node.search('AuthorsText').first
        self.authors = BookWorm::Author.parse(authors_node.content)
      end
      if publisher_node = node.search('PublisherText').first
        self.publisher = BookWorm::Publisher.parse(publisher_node.content)
      end
    end
  end
end
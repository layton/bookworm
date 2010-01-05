require File.dirname(__FILE__) + '/test_helper.rb'

class TestBook < Test::Unit::TestCase

  def setup
  end
  
  def test_new
    book = BookWorm::Book.new(book_data_xml_node)
    assert_equal '0210406240', book.isbn
    assert_equal 'Law and disorder', book.title
    
    assert_equal 1, book.authors.size
    assert_equal 'V.', book.authors.first.first_name

    assert_not_nil book.publisher
    assert_equal 'Asia Pub. House', book.publisher.name, book.publisher.inspect
  end
  
  protected
    # http://isbndb.com/docs/api/51-books.html
    def book_data_xml
      <<-eos
      <BookData book_id="law_and_disorder" isbn="0210406240">
         <Title>Law and disorder</Title>
         <TitleLong>
          Law and disorder: law enforcement in television network news
         </TitleLong>
         <AuthorsText>V. M. Mishra</AuthorsText>
         <PublisherText publisher_id="asia_pub_house">
          New York: Asia Pub. House, c1979.
         </PublisherText>
         <Details dewey_decimal="302.2/3"
                  dewey_decimal_normalized="302.23"
                  lcc_number="PN4888"
                  language="eng"
                  physical_description_text="x, 127 p. ; 22 cm."
                  edition_info=""
                  change_time="2004-10-19T23:52:56"
                  price_time="2005-07-29T02:06:41" />
      </BookData>
      eos
    end
    
    def book_data_xml_node
      Nokogiri::XML(book_data_xml).root
    end
end

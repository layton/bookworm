require File.dirname(__FILE__) + '/test_helper.rb'

class TestSearch < Test::Unit::TestCase

  def setup
  end

  def test_url
    BookWorm::Search.config = { :access_key => 'secret' }
    search = BookWorm::Search.new('book', :results => 'details', :isbn => '123')
    
    search.url.include?('access_key=secret')
    search.url.include?('results=details')
    search.url.include?('book.xml?')
    search.url.include?('index1=isbn')
    search.url.include?('value1=123')
  end
end

require File.dirname(__FILE__) + '/test_helper.rb'

class TestAuthor < Test::Unit::TestCase

  def setup
  end
  
  def test_parse_single
    assert_equal 1, BookWorm::Author.parse("First Last").size
  end

  def test_parse_multiple
    assert_equal 2, BookWorm::Author.parse("First Last, Second Last").size
  end
  
  def test_parse_two_names
    author = BookWorm::Author.new("First Last")
    assert_equal "First", author.first_name
    assert_equal "Last", author.last_name
    assert_nil author.middle_name
  end
  
  def test_parse_three_names
    author = BookWorm::Author.new("First M. Last")
    assert_equal "First", author.first_name
    assert_equal "M.", author.middle_name
    assert_equal "Last", author.last_name
  end
end

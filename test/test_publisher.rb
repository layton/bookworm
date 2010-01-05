require File.dirname(__FILE__) + '/test_helper.rb'

class TestPublisher < Test::Unit::TestCase

  def setup
  end
  
  def test_parse_without_city
    publisher = BookWorm::Publisher.new("Lone Pine Publishing, c2000")
    assert_nil publisher.city
    assert_equal "Lone Pine Publishing", publisher.name
    assert_equal "2000", publisher.year
  end

  def test_parse_with_city
    publisher = BookWorm::Publisher.new("Edmonton: Lone Pine Publishing, c2000")
    assert_equal "Edmonton", publisher.city
    assert_equal "Lone Pine Publishing", publisher.name
    assert_equal "2000", publisher.year
  end
end

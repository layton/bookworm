$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'nokogiri'
require 'net/http'
require 'bookworm/author'
require 'bookworm/book'
require 'bookworm/publisher'
require 'bookworm/search'

module BookWorm
  VERSION = '0.0.1'

  def self.books(options = {})
    BookWorm::Search.new('books', options.merge(:results => 'details')).results
  end

  def self.config=(config)
    BookWorm::Search.config = config
  end
end
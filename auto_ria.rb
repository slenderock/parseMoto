require 'nokogiri'

class AutoRia
  PRICE_TAG = 'section.price .price_value strong'.freeze
  attr_reader :doc, :title, :attributes
  
  def initialize(response)
    @doc = Nokogiri::HTML response
    @attributes = {}
  end

  def download
    run_commands
    attributes
  end
  
  def run_commands
    fetch_title
    assign_title_attributes
    fetch_price
  end

  def assign_title_attributes
    title_split = title.split
    title_split.pop

    attributes[:engine] = title_split.pop
  end

  def fetch_title
    @title = doc.css('.auto-content_title').children
    p title
  end

  def fetch_price
    attributes[:price] = doc.css(PRICE_TAG).children.to_s
  end
end

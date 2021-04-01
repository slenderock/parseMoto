require 'nokogiri'

class Olx
  attr_reader :doc
  
  def initialize(response)
    @doc = Nokogiri::HTML response
  end 

  def download
    {
      name: fetch_name,
      price: fetch_price
    }  
  end

  def fetch_name
    doc.css('h1.head').first['title']
  end

  def fetch_price
    doc.css('section.price .price_value strong').children.to_s
  end
end

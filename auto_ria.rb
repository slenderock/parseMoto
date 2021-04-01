require 'nokogiri'
require './consts'

class AutoRia
  PRICE_TAG = 'section.price .price_value strong'.freeze
  TITLE_TAG = '.auto-content_title'.freeze
  ENGINE_TAG = '.technical-info'.freeze
  CITY_TAG = '#showLeftBarView .item_inner'.freeze
  HEADER_TAG = '#heading-cars h1.head'.freeze

  attr_reader :doc, :title, :attributes
  
  def initialize(response)
    @doc = Nokogiri::HTML response
    @attributes = RESPONSE_INTERFACE
  end

  def download
    run_commands
    
    attributes
  end
  
  private 

  def run_commands
    assign_title_attributes
    attributes[:city] = city_css
    attributes[:price] = price_css
  end

  def assign_title_attributes
    @title = title_css
    title_split = title.split
    attributes[:year] = title_split.pop
    attributes[:brand] = title_split.shift
    attributes[:model] = title_split.join
    attributes[:engine] = parse_engine
  end

  def title_css
    doc.css(TITLE_TAG).children.to_s
  rescue 
    PARSING_ERROR
  end
  
  def price_css 
    doc.css(PRICE_TAG).children.to_s
  rescue
    PARSING_ERROR
  end
  
  def city_css
    doc.css(CITY_TAG).first.children.to_s.split.first.strip
  # rescue
  #   PARSING_ERROR
  end

  def parse_engine
    engine_by_title
  rescue 
    PARSING_ERROR
  end

  def header_css
    doc.css(HEADER_TAG).first.attributes['title'].to_s
  end

  def engine_by_title
    header_css.split.map(&:to_i).find {|number| number.between?(ENGINE_RANGE[:min], ENGINE_RANGE[:max])}
  end
end

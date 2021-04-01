require 'nokogiri'
require './consts'

class Olx
  PRICE_TAG = 'h3.css-8kqr5l-Text.eu5v0x0'.freeze
  TITLE_TAG = '.css-1oarkq2-Text.eu5v0x0'.freeze
  YEAR_TAG = '.css-xl6fe0-Text.eu5v0x0'.freeze
  CITY_TAG = '.css-7xdcwc-Text.eu5v0x0'.freeze

  attr_reader :doc, :title, :attributes
  
  def initialize(response, url)
    @doc = Nokogiri::HTML(response)
    @attributes = RESPONSE_INTERFACE
    attributes[:url] = url
  end

  def download
    run_commands

    attributes
  end

  private

  def run_commands
    @title = title_css

    attributes[:city] = city_css
    attributes[:price] = price_css
    attributes[:brand] = title
    attributes[:engine] = parse_engine
    attributes[:year] = parse_year
  end

  def title_css
    doc.css(TITLE_TAG).children.to_s.gsub(/[^\w\s]/, '').strip
  rescue
    PARSING_ERROR
  end

  def price_css 
    doc.css(PRICE_TAG).children.to_s.split('<').first
  rescue
    PARSING_ERROR
  end

  def city_css
    doc.css(CITY_TAG).children.to_s.strip
  rescue
    PARSING_ERROR
  end

  def parse_engine
    engine_by_title
  rescue 
    PARSING_ERROR
  end

  def parse_year
    doc.css(YEAR_TAG).children.to_s.strip.split.map(&:to_i).find { |number| number.between?(YEAR_RANGE[:min], YEAR_RANGE[:max]) }
  rescue
    PARSING_ERROR     
  end

  def engine_by_title
    title.split.map(&:to_i).find { |number| number.between?(ENGINE_RANGE[:min], ENGINE_RANGE[:max]) }
  end
end

require 'nokogiri'
require 'open-uri'

class CovidWebSpider
  attr_reader :doc, :connected

  def initialize(url = 'https://www.worldometers.info/coronavirus/')
    @url = url
    @doc = nil
    @connected = false
  end

  def make_connection
    begin
      @doc = Nokogiri::HTML(URI.open('https://www.worldometers.info/coronavirus/'))
      @connected = true
    rescue StandardError
      @connected = false
    end
    @connected
  end

  def crawl
    @doc.css('table#main_table_countries_today tbody').first
  end

  def payload
    @cocoon = {}
    crawl.css('tr').each do |row|
      tranformed_row = row.css('td').map { |data| data.content.downcase.strip }
      _, country, total_cases, new_cases, total_death, new_death, total_recovered, _, active_cases = tranformed_row
      @cocoon[country] = [total_cases, new_cases, total_death, new_death, total_recovered, active_cases]
    end
    @cocoon
  end
end

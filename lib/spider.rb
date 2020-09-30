#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open('https://www.worldometers.info/coronavirus/'))

#fetch the data in the table
data_table = doc.css('table#main_table_countries_today tbody').first


# filter in the rows of the data_table
data_rows = data_table.css('tr').slice(0, 10)

#parse these rows
for row in data_rows
  sn, country, t_cases, n_cases, t_death, n_death, t_recovered, a_cases = row.css 'td'
  puts "#{country.content.strip} #{t_cases.content.strip} #{n_cases.content.strip} #{t_death.content.strip} #{n_death.content.strip} #{t_recovered.content.strip} #{a_cases.content.strip}"
end

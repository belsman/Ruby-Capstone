#!/usr/bin/env ruby

require_relative '../lib/spider'
require_relative '../lib/utils'

def get_user_input(data_to_check)
  user_input = ''
  loop do
    user_input = gets.chomp.downcase
    break if data_to_check.include?(user_input) || user_input.empty?

    puts user_input + ' Does not exist'
  end
  user_input
end

puts '

WELCOME TO THE COVID-19 DAILY REPORTER PROGRAMS

=================================================

See daily summary reports by simply running this program daily.

press ENTER to continue.
'

gets

puts '.....Fetching Daily Data'

spider = CovidWebSpider.new
spider.make_connection

if spider.connected
  all_data = spider.payload
  region_list = all_data.keys
  world_data = all_data['world']

  puts 'Success!'
  puts ''

  puts display_covid_table(world_data)

  puts ''

  loop do
    puts 'Get Report Countries or Soverignty'
    puts 'Example: Type in either (Nigeria, Germany, Kenya, Romania, Western-Sahara etc...)'
    chosen_region = get_user_input(region_list)
    break if chosen_region.empty?

    puts ''
    chosen_region_data = all_data[chosen_region]
    puts display_covid_table(chosen_region_data, chosen_region)
  end
else
  puts ''
  puts "Connection Error .... Seem like you don't have internet connection."
end

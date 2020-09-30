require 'terminal-table'

puts '

WELCOME TO THE COVID-19 DAILY REPORTER PROGRAMS

=================================================

See daily summary reports by simply running this program daily.

press ENTER to continue.
'

gets

def display_covid_table(report_list)
  rows = []
  rows << report_list
  Terminal::Table.new title: 'WORLD WIDE', headings: %w[CASES DEATH RECOVERED], rows: rows, style: { width: 50 }
end

def get_matching_location(user_location)
  # returns a valid location that matches
end

puts '.....Fetching Daily Data'
sleep(3)
stud_bool = true
if stud_bool
  puts 'Success!'
  sleep(2)
  puts ''
  puts display_covid_table(%w[000000 000000 000000])
  puts ''
  puts 'Get Report Countries or Soverignty'
  puts 'Example: Type in either (Nigeria, Germany, Kenya, Romania, Western-Sahara etc...)'
  gets.chomp
  if stud_bool
    # if location matches any in the collated data -- show result
    puts display_covid_table(%w[000000 000000 000000])
  else
    puts 'location not found'
  end
else
  puts 'An Error Occurred'
end

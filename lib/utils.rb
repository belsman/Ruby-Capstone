require 'terminal-table'

def display_covid_table(report_list, title = 'WORLD WIDE')
  table_header = ['TOTAL CASES', 'NEW CASES', 'TOTAL DEATHS', 'NEW DEATHS', 'TOTAL RECOVERED', 'ACTIVE CASES']
  rows = []
  rows << report_list
  Terminal::Table.new title: title.upcase, headings: table_header, rows: rows
end

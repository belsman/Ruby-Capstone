require './lib/utils'

describe 'utils' do
  describe 'display_covid_table' do
    it 'should be a Terminal::Table' do
      table = display_covid_table((0..6))
      expect(table).to be_an Terminal::Table
    end
  end
end

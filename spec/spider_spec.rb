require './lib/spider'

describe CovidWebSpider do
  let(:spider) { CovidWebSpider.new }

  describe '#connect' do
    it 'returns \'false\' prior to connection' do
      expect(spider.connected).to be false
    end

    it 'returns \'true\' on connection' do
      spider.make_connection
      expect(spider.connected).to be true
    end

    it 'returns a Nokogiri documentafter connection' do
      spider.make_connection
      doc_klas = Nokogiri::HTML::Document
      expect(spider.doc).to be_an doc_klas
    end
  end
  
  describe '#crawl' do
    let(:spider) { CovidWebSpider.new}

    it 'returns a Nokogiri tbody node' do
      spider.make_connection
      expect(spider.crawl.name).to be_eql('tbody')
    end

    it 'returns 223 rows means page hasn\'t changed' do
      spider.make_connection
      data_rows_numbers = spider.crawl.css('tr').length
      expect(data_rows_numbers).to be_eql(223)
    end
  end

  describe '#payload' do
    before(:each) do
      spider.make_connection
    end

    it 'returns a hash data-type' do
      cocoon = spider.payload
      expect(cocoon).to be_an Hash
    end

    it 'returns a payload of data' do
      cocoon = spider.payload
      expect(cocoon.length > 90).to be true
    end

    it 'does not exceed a threshold data' do
      cocoon = spider.payload
      expect(cocoon.length < 224).to be true
    end

    it 'can access country as key and data as values' do
      country = %w[USA India China].shuffle.first
      cocoon = spider.payload
      expect(cocoon[country].length).to  be_eql(6)
    end
  end
end

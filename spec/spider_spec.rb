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
end

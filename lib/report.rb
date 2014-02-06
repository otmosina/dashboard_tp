require 'singleton'
class Report
  include Singleton
  #url = 'http://tp.aviasales.ru/report.php?r=71&u1=12&m=1&h=bf7cddbb19843b15b06138169de0b06a15b28f85&export=json'
  attr_accessor :data, :type
  def initialize
    config = YAML::load(File.open('config/report.yml'))
    @request_url = config[type.to_s]["url"]
  end



  def fetch_data
    get_raw_data if data.nil?
    prepare_data
  end

  def get_raw_data
    @data = Oj.load(RestClient.get(@request_url))
  end

  private

  def prepare_data
  end
end

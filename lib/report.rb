require 'singleton'
class Report
  include Singleton
  #url = 'http://tp.aviasales.ru/report.php?r=71&u1=12&m=1&h=bf7cddbb19843b15b06138169de0b06a15b28f85&export=json'
  attr_accessor :data, :type, :config, :mode
  attr_reader :data
  def initialize
    @config = YAML::load(File.open('config/report.yml'))
  end

  def detailed_fetch_data
    @mode = :detailed
    @request_url = config[type.to_s]["detailed_url"]
    get_raw_data
    prepare_data
  end

  def fetch_data
    @mode = :default
    @request_url = config[type.to_s]["url"]
    get_raw_data
    prepare_data
  end


  def get_raw_data
    @data = Oj.load(RestClient.get(@request_url)) if data.nil?
  end

  private

  def prepare_data
  end
end

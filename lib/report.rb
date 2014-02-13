
class Report
  include Singleton
  attr_accessor :data, :report_type, :config, :mode
  attr_reader :data

  def initialize
    @config = YAML::load(File.open('config/report.yml'))
  end


  def fetch_data
    @request_url = config["custom"][report_type.to_s]["url"]
    get_raw_data
    prepare_data
  end


private


  def get_raw_data
    @data = Oj.load(RestClient.get(@request_url)) #if data.nil?
  end


  def prepare_data
  end
end

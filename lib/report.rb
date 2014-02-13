
class Report
  include Singleton
  attr_accessor :data, :report_type, :config, :mode
  attr_reader :data

  def initialize
    @config = YAML::load(File.open('config/report.yml'))
  end

  def detailed_fetch_data
    @mode = :detailed
    @request_url = config[report_type.to_s]["detailed_url"]
    get_raw_data
    prepare_data
  end

  def fetch_data
    @mode = :default
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

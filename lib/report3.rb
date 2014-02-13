class Report3
 attr_accessor  :report_type, :period_type, :config
  attr_reader :data

  def initialize report_type_in
    @report_type = report_type_in
    @config = YAML::load(File.open('config/report.yml'))
  end

  def fetch_data_hourly
    fetch :hourly
  end

  def fetch_data_daily
    fetch :daily
  end

  def fetch_data_custom
    @request_url = config["custom"][report_type.to_s]["url"]
    get_raw_data
    prepare_data
  end

private

  def fetch mode_report
    @request_url = config["periods"][report_type.to_s][period_type.to_s][mode_report.to_s]
    get_raw_data
    prepare_data
  end

  def get_raw_data
    @data = Oj.load(RestClient.get(@request_url)) if data.nil?
  end


  def prepare_data
  end
end

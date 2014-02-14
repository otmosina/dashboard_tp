class Report
  attr_accessor  :report_type, :period_type, :config
  attr_reader :data

  PERIOD_TYPES = [ :one_periods, :two_periods, :three_periods, :custom ]
  MODE_REPORTS_TYPES = [ :hourly, :daily, :custom ]

  def initialize report_type_in, period_type_in
    @report_type = report_type_in
    @period_type = period_type_in
    @config = YAML::load(File.open('config/report.yml'))
  end

  def fetch mode_report
    if MODE_REPORTS_TYPES.member? mode_report
      if mode_report == :custom
        @request_url = config["custom"][report_type.to_s]["url"] rescue nil
      else
        @request_url = config["periods"][report_type.to_s][period_type.to_s][mode_report.to_s] rescue nil
      end
        return [] if @request_url.nil?
        get_raw_data
        prepare_data
    else
      []
    end
  end
private


  def get_raw_data
    @data = Oj.load(RestClient.get(@request_url)) if data.nil?
  end


  def prepare_data
    case period_type
      when :one_periods   then prepare_one_periods
      when :two_periods   then prepare_two_periods
      when :three_periods then prepare_three_periods
      when :custom then prepare_custom
      else prepare_three_periods
    end
  end

  def prepare_three_periods
    result = {
      'first_series' => {
        'dates' => @data[0].map{|values|values[0]},
        'values' => @data[0].map{|values|values[1]}
      },
      'second_series' => {
        'dates' => @data[0].map{|values|values[0]},
        'values' => @data[1].map{|values|values[1]}
      },
      'third_series' => {
        'dates' => @data[0].map{|values|values[0]},
        'values' => @data[2].map{|values|values[1]}
      }
    }
    Oj.dump(result)
  end

  def prepare_two_periods
    result = {
      'first_series' => {
        'dates' => @data[0].map{|values|values[0]},
        'values' => @data[0].map{|values|values[1]}
      },
      'second_series' => {
        'dates' => @data[0].map{|values|values[0]},
        'values' => @data[1].map{|values|values[1]}
      }
    }
    Oj.dump(result)
  end

  def prepare_one_periods
    result = {
      'first_series' => {
        'dates' => @data.map{|values|values[0]},
        'values' => @data.map{|values|values[1]}
      }
    }
    Oj.dump(result)
  end

  def prepare_custom
    copy_data = data
    result = {
      'first_values' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[1]}
      },
      'second_values' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[2]}
      },
      'third_values' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[3]}
      },
      'fourth_values' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[4]}
      }
    }
  end




end

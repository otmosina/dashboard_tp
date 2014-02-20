# require "timedcache"
module Report

  CACHE_TTL = 5 * 60
  PERIOD_TYPES = [ :one_periods, :two_periods, :three_periods, :custom ]
  MODE_REPORTS_TYPES = [ :hourly, :daily, :fifteen_min, :custom ]
  @@config = YAML::load(File.open('config/report.yml'))
  @@column_count = 12
  # @cache = TimedCache.new

  def fetch report_type_in, period_type_in, mode_report_in
    @@report_type = report_type_in
    @@period_type = period_type_in
    @@mode_report = mode_report_in
    fetch_cache do
      if MODE_REPORTS_TYPES.member? @@mode_report
        if @@mode_report == :custom
          @@request_url = @@config["custom"][@@report_type.to_s]["url"] rescue nil
        else
          @@request_url = @@config["periods"][@@report_type.to_s][@@period_type.to_s][@@mode_report.to_s] rescue nil
        end
          return [] if @@request_url.nil?
          @@data = get_raw_data
          prepare_data
      else
        []
      end
    end
  end

  def clear_cache
    $redis.keys("dashboard*").each do |key|
      $redis.del(key)
    end
  end

  def set_column_count count
    @@column_count = count
  end

  def get_column_count
    @@column_count
  end


  extend self


private

  def fetch_cache
    cached = $redis.get cache_key
    #p cached
    return Oj.load(cached) if cached
    @@data = yield
    $redis.set  cache_key, Oj.dump(@@data)
    $redis.expire cache_key, CACHE_TTL
    @@data
  end

  def cache_key
    ["dashboard", @@report_type, @@period_type, @@mode_report].join(?:)
  end


  def get_raw_data
    #if cache[cache_key].nil?
    #  request_data = Oj.load(RestClient.get(@request_url))
    #  cache.put cache_key, request_data, cache_expare
    #end
    #cache[cache_key]
    url = @@request_url % @@column_count
    puts "request url #{url}"
    Oj.load(RestClient.get(url))
  end


  # def cache_key
  #   key = [ @report_type, "_", @period_type, "_", @mode_report ].join.to_sym
  #   [ @report_type, "_", @period_type, "_", @mode_report ].join.to_sym
  # end
  #
  # def cache_expare
  #   180
  # end


  def prepare_data
    case @@period_type
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
        'dates' => @@data[0].map{|values|values[0]},
        'values' => @@data[0].map{|values|values[1]}
      },
      'second_series' => {
        'dates' => @@data[0].map{|values|values[0]},
        'values' => @@data[1].map{|values|values[1]}
      },
      'third_series' => {
        'dates' => @@data[0].map{|values|values[0]},
        'values' => @@data[2].map{|values|values[1]}
      }
    }
    result
  end

  def prepare_two_periods
    result = {
      'first_series' => {
        'dates' => @@data[0].map{|values|values[0]},
        'values' => @@data[0].map{|values|values[1]}
      },
      'second_series' => {
        'dates' => @@data[0].map{|values|values[0]},
        'values' => @@data[1].map{|values|values[1]}
      }
    }
    result
  end

  def prepare_one_periods
    result = {
      'first_series' => {
        'dates' => @@data.map{|values|values[0]},
        'values' => @@data.map{|values|values[1]}
      }
    }
    result
  end

  def prepare_custom
    copy_data = @@data
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

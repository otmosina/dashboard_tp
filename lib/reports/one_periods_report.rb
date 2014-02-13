class OnePeriodsReport < Report3
  def initialize report_type_in
    @period_type = :one_periods
    super report_type_in
  end
private
  def prepare_data
    result = {
      'first_series' => {
        'dates' => @data.map{|values|values[0]},
        'values' => @data.map{|values|values[1]}
      }
    }
    Oj.dump(result)
  end
end

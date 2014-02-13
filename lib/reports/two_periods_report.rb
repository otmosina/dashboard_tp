class ThreePeriodsReport < Report3
  def initialize report_type_in
    @period_type = :three_periods
    super report_type_in
  end
private
  def prepare_data
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
end

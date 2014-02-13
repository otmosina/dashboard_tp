
class WidgetStatisticsReport < Report
  def initialize
    @report_type = :widget_statistics
    super
  end


private
  def prepare_data

    copy_data = data

    result = {
      'one_series_a' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[1]}
      },
      'one_series_b' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[2]}
      },
      'two_series_a' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[3]}
      },
      'two_series_b' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[4]}
      }
    }
    Oj.dump(result)
  end

end

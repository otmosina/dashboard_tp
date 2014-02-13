
class WidgetStatisticsReport < Report
  def initialize
    @report_type = :widget_statistics
    super
  end


private
  def prepare_data

    copy_data = data

    result = {
      'inits' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[1]}
      },
      'shows' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[2]}
      },
      'leads' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[3]}
      },
      'searches' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[4]}
      }
    }
    Oj.dump(result)
  end

end

class WidgetStatisticsReport < Report
  def initialize
    @type = :widget_statistics
    super
  end


private
  def prepare_data

    copy_data = mode == :default ? deep_prepare_data(data) : data

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

  def deep_prepare_data data
    copy_data = Marshal.load( Marshal.dump(data) )
    data_datetime = copy_data.map{|values|values[0]}
    data_datetime.map! do |item|
      date = item.split(" ")[0]
      time = item.split(" ")[1]
      date.split("-")[2]+"d "+time.split(":")[0]+"h"
    end
    copy_data.each_with_index{|values, index|values[0] = data_datetime[index]}
  end
end

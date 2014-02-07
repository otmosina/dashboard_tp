class AffstatisticReport < Report
  def initialize
    @type = :aff_statistics
    super
  end
private
  def prepare_data

    #data_datetime = @data.map{|values|values[0]}
    #data_datetime.map! do |item|
    #  date = item.split(" ")[0]
    #  time = item.split(" ")[1]
    #  date.split("-")[2]+"d "+time.split(":")[0]+"h"
    #end
    #@data.each_with_index{|values, index|values[0] = data_datetime[index]}

    result = {
      'paid_bookings' => {
        'dates' => @data.map{|values|values[0]},
        'values' => @data.map{|values|values[1]}
      },
      'clicks' => {
        'dates' => @data.map{|values|values[0]},
        'values' => @data.map{|values|values[2]}
      },
      'searches' => {
        'dates' => @data.map{|values|values[0]},
        'values' => @data.map{|values|values[3]}
      }
    }
    Oj.dump(result)
  end
end

class AffprofitReport < Report
  def initialize
    @type = :aff_profit
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
      'profits' => {
        'dates' => @data.map{|values|values[0]},
        'values' => @data.map{|values|values[1]}
      }
    }
    Oj.dump(result)
  end
end

class AffamountReport < Report
  def initialize
    @type = :aff_amount
    super
  end
private
  def prepare_data

    copy_data = Marshal.load( Marshal.dump(data) )

    data_datetime = copy_data.map{|values|values[0]}
    data_datetime.map! do |item|
      date = item.split(" ")[0]
      time = item.split(" ")[1]
      date.split("-")[2]+"d "+time.split(":")[0]+"h"
    end
    copy_data.each_with_index{|values, index|values[0] = data_datetime[index]}

    result = {
      'amount' => {
        'dates' => copy_data.map{|values|values[0]},
        'values' => copy_data.map{|values|values[1]}
      }
    }
    Oj.dump(result)
  end
end


class CustomReport < Report3
private

  def prepare_data
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

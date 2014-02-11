class AffstatisticReport < Report
  def initialize
    @type = :aff_statistics
    super
  end
private
  def prepare_data
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

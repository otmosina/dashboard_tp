class AffprofitReport < Report
  def initialize
    @type = :aff_profit
    super
  end
private
  def prepare_data
    result = {
      'profits' => {
        'dates' => @data.map{|values|values[0]},
        'values' => @data.map{|values|values[1]}
      }
    }
    Oj.dump(result)
  end
end

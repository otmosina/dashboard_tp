class AffsearchesReport < Report
  def initialize
    @type = :aff_searches
    super
  end
private
  def prepare_data
    result = {
      'now' => {
        'dates' => @data[0].map{|values|values[0]},
        'values' => @data[0].map{|values|values[1]}
      },
      'day' => {
        'dates' => @data[0].map{|values|values[0]},
        'values' => @data[1].map{|values|values[1]}
      },
      'week' => {
        'dates' => @data[0].map{|values|values[0]},
        'values' => @data[2].map{|values|values[1]}
      }
    }
    Oj.dump(result)
  end
end

class WidgetReport < Report
  def initialize
    @type = :widget_analitics
    super
  end
private
  def prepare_data
    result = {
      'inits' => {
        'dates' => @data.map{|values|values[0]},
        'values' => @data.map{|values|values[1]}
      },
      'shows' => {
        'dates' => @data.map{|values|values[0]},
        'values' => @data.map{|values|values[2]}
      },
      'leads' => {
        'dates' => @data.map{|values|values[0]},
        'values' => @data.map{|values|values[3]}
      },
      'searches' => {
        'dates' => @data.map{|values|values[0]},
        'values' => @data.map{|values|values[4]}
      }
    }
    Oj.dump(result)
  end
end

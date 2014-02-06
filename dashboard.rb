


get '/data.json' do
  content_type :json

  url = 'http://tp.aviasales.ru/report.php?r=51&m=1&h=a8022265abe4a76106cebfebe2c14e0ec21c24ca&i=1&export=json'
  affiliates = Oj.load(RestClient.get(url))

  result = {
  	'affiliates' => {
  	  'today' => affiliates[0],
  	  'yesterday' => affiliates[1],
      'total' => affiliates[2]
  	},
  	'profit' => {
      'today' => affiliates[3],
      'yesterday' => affiliates[4],
    },
    'searches' => {
      'today' => affiliates[5],
      'yesterday' => affiliates[6],
    },
    'bookings' => {
      'today' => affiliates[7],
      'yesterday' => affiliates[8],
    },
    'clicks' => {
      'today' => affiliates[9],
      'yesterday' => affiliates[10],
    },
  }
  Oj.dump(result)
end

get '/plot_affiliates_data.json' do
  content_type :json
  url = 'http://tp.aviasales.ru/report.php?r=59&m=1&h=85bfb612266fc8ab6b6d7473782e1403c11bbb5e&export=json'
  affiliates_count_plot = Oj.load(RestClient.get(url))
  Oj.dump({
    'dates' => affiliates_count_plot.map{|array| array[1]},
    'values' => affiliates_count_plot.map{|array| array[0]}
  })
end

get '/plot_profit_data.json' do
  content_type :json
  url = 'http://tp.aviasales.ru/report.php?r=67&m=1&h=84a2889a1d53c79a1301ed8c96a611db5c86b1fb&i=1&export=json'
  affiliates_profit_plot = Oj.load(RestClient.get(url))
  result = {
    'profit' => {
      'dates' => affiliates_profit_plot[0].map{|array| array[1]},
      'values' => affiliates_profit_plot[0].map{|array| array[0]}
    },
    'searches' => {
      'dates' => affiliates_profit_plot[1].map{|array| array[1]},
      'values' => affiliates_profit_plot[1].map{|array| array[0]}
    }
  }
  Oj.dump(result)
end

get '/plot_clicks_and_bookings_data.json' do
  content_type :json
  url = 'http://tp.aviasales.ru/report.php?r=68&m=1&h=45763f5654aae31c1cae9727db23e70feeb17cad&i=1&export=json'
  affiliates_bookings_and_clicks_plot = Oj.load(RestClient.get(url))
  result = {
    'bookings' => {
      'dates' => affiliates_bookings_and_clicks_plot[0].map{|array| array[1]},
      'values' => affiliates_bookings_and_clicks_plot[0].map{|array| array[0]}
    },
    'clicks' => {
      'dates' => affiliates_bookings_and_clicks_plot[1].map{|array| array[1]},
      'values' => affiliates_bookings_and_clicks_plot[1].map{|array| array[0]}
    }
  }
  Oj.dump(result)
end
$GLOBAL = symbolize_recursively! YAML.load_file(Rails.root.join('config', 'config.global.yml'))
get '/fetch_widget_analitics.json' do
  content_type :json
  url = 'http://tp.aviasales.ru/report.php?r=71&u1=12&m=1&h=bf7cddbb19843b15b06138169de0b06a15b28f85&export=json'
  if @values_widget_events_and_searches.nil?
    binding.pry
    @values_widget_events_and_searches = Oj.load(RestClient.get(url))
  end
  result = {
    'inits' => {
      'dates' => @values_widget_events_and_searches.map{|values|values[0]},
      'values' => @values_widget_events_and_searches.map{|values|values[1]}
    },
    'shows' => {
      'dates' => @values_widget_events_and_searches.map{|values|values[0]},
      'values' => @values_widget_events_and_searches.map{|values|values[2]}
    },
    'leads' => {
      'dates' => @values_widget_events_and_searches.map{|values|values[0]},
      'values' => @values_widget_events_and_searches.map{|values|values[3]}
    },
    'searches' => {
      'dates' => @values_widget_events_and_searches.map{|values|values[0]},
      'values' => @values_widget_events_and_searches.map{|values|values[4]}
    }
  }
  Oj.dump(result)
end

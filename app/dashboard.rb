class Dashboard < Sinatra::Base
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
  get '/fetch_widget_analitics.json' do
    content_type :json
    WidgetReport.instance.fetch_data
  end

  get '/dashboard' do

    @data_widget_events = WidgetEventsReport.instance.fetch_data
    @data_widget_statistics = WidgetStatisticsReport.instance.fetch_data
    @data_profit = AffprofitReport.instance.fetch_data
    @data_statistics = AffstatisticReport.instance.fetch_data
    @data_affamount = AffamountReport.instance.fetch_data

    erb :index#, :layout => :post
  end

  get '/dashboard_new' do

    @data_widget_events = WidgetEventsReport.instance.fetch_data
    @data_widget_statistics = WidgetStatisticsReport.instance.fetch_data

    @data_profit = AffprofitReport.instance.fetch_data

    #@data_affamount = AffamountReport.instance.fetch_data


    AffsearchesReport.instance.type = :aff_searches
    @data_aff_searches = AffsearchesReport.instance.fetch_data
    AffsearchesReport.instance.type = :aff_clicks
    @data_aff_clicks = AffsearchesReport.instance.fetch_data
    AffsearchesReport.instance.type = :aff_paidbookings
    @data_aff_paidbookings = AffsearchesReport.instance.fetch_data
    AffsearchesReport.instance.type = :aff_amount_3periods
    @data_aff_amount_3periods = AffsearchesReport.instance.fetch_data

    erb :index_pretty#, :layout => :post
  end


end

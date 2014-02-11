class DetailedDashboard < Sinatra::Base
  get '/detailed_dashboard' do
    #@data_widget_events = WidgetEventsReport.instance.detailed_fetch_data
    #@data_detailed_widget_statistics = WidgetStatisticsReport.instance.detailed_fetch_data
    @data_detailed_profit = AffprofitReport.instance.detailed_fetch_data
    @data_detailed_statistics = AffstatisticReport.instance.detailed_fetch_data
    @data_affamount = AffamountReport.instance.detailed_fetch_data
    erb :detailed_index
  end

end

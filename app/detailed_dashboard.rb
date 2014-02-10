class DetailedDashboard < Sinatra::Base
  get '/detailed_dashboard' do
    @data_widget_events = WidgetEventsReport.instance.detailed_fetch_data
    @data_widget_statistics = WidgetStatisticsReport.instance.detailed_fetch_data
    erb :index
  end

end

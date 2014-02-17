class Dashboard < Sinatra::Base

  get '/dashboard/hourly' do
    @data_widget_events     = Report.fetch :widget_events, :custom, :custom
    @data_widget_statistics = Report.fetch :widget_statistics, :custom, :custom



    @data_aff_searches        = Report.fetch :aff_searches,     :three_periods, :hourly
    @data_aff_clicks          = Report.fetch :aff_clicks,       :three_periods, :hourly
    @data_aff_paidbookings    = Report.fetch :aff_paidbookings, :three_periods, :hourly
    @data_aff_amount_3periods = Report.fetch :aff_amount,        :three_periods, :hourly
    @data_aff_profit_3periods = Report.fetch :aff_profit, :three_periods, :daily
    erb :index, :layout => :layout
  end


  get '/dashboard/widget_stat' do
    @data_widget_inits    = Report.fetch :widget_statistics_inits, :three_periods, :hourly
    @data_widget_shows    = Report.fetch :widget_statistics_shows, :three_periods, :hourly
    @data_widget_leads    = Report.fetch :widget_statistics_leads, :three_periods, :hourly
    @data_widget_searches = Report.fetch :widget_statistics_searches, :three_periods, :hourly
    @data_widget_clicks   = Report.fetch :widget_statistics_clicks, :three_periods, :hourly
    @data_widget_bookings = Report.fetch :widget_statistics_bookings, :three_periods, :hourly
    @data_widget_profit   = Report.fetch :widget_statistics_profit, :three_periods, :hourly
    @data_widget_paid_bookings_profit   = Report.fetch :widget_paid_bookings_profit, :three_periods, :hourly
    erb :widget_stat, :layout => :layout
  end
end

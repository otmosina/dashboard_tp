class Dashboard < Sinatra::Base

  before '/dashboard_new' do
    @report_affsearches_3period     ||= ThreePeriodsReport.new :aff_searches
    @report_affclicks_3period       ||= ThreePeriodsReport.new :aff_clicks
    @report_affpaidbookings_3period ||= ThreePeriodsReport.new :aff_paidbookings
    @report_affamount_3period       ||= ThreePeriodsReport.new :aff_amount
    @report_affprofit_1period       ||= OnePeriodsReport.new :aff_profit
  end


  get '/dashboard_new' do
    @data_widget_events = WidgetEventsReport.instance.fetch_data
    @data_widget_statistics = WidgetStatisticsReport.instance.fetch_data


    @data_aff_searches        = @report_affsearches_3period.fetch_data_hourly
    @data_aff_clicks          = @report_affclicks_3period.fetch_data_hourly
    @data_aff_paidbookings    = @report_affpaidbookings_3period.fetch_data_hourly
    @data_aff_amount_3periods = @report_affamount_3period.fetch_data_hourly
    @data_aff_profit_1periods = @report_affprofit_1period.fetch_data_daily

    erb :index#, :layout => :post
  end


end

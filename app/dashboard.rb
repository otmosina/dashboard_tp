class Dashboard < Sinatra::Base

  before '/dashboard_new' do
    @report_affsearches_3period     ||= ThreePeriodsReport.new :aff_searches
    @report_affclicks_3period       ||= ThreePeriodsReport.new :aff_clicks
    @report_affpaidbookings_3period ||= ThreePeriodsReport.new :aff_paidbookings
    @report_affamount_3period       ||= ThreePeriodsReport.new :aff_amount
    #@report_affprofit_1period       ||= OnePeriodsReport.new :aff_profit

    @report_affprofit_3period       ||= ThreePeriodsReport.new :aff_profit

    @report_widget_events_custom     ||= CustomReport.new :widget_events
    @report_widget_statistics_custom ||= CustomReport.new :widget_statistics
  end


  get '/dashboard_new' do
    @data_widget_events =  @report_widget_events_custom.fetch_data_custom
    @data_widget_statistics = @report_widget_statistics_custom.fetch_data_custom



    @data_aff_searches        = @report_affsearches_3period.fetch_data_hourly
    @data_aff_clicks          = @report_affclicks_3period.fetch_data_hourly
    @data_aff_paidbookings    = @report_affpaidbookings_3period.fetch_data_hourly
    @data_aff_amount_3periods = @report_affamount_3period.fetch_data_hourly
    @data_aff_profit_3periods = @report_affprofit_3period.fetch_data_daily

    erb :index#, :layout => :post
  end


end

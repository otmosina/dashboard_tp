class Dashboard < Sinatra::Base

  before '/dashboard/hourly' do
    @report_affsearches_3period      ||= Report.new :aff_searches, :three_periods
    @report_affclicks_3period        ||= Report.new :aff_clicks, :three_periods
    @report_affpaidbookings_3period  ||= Report.new :aff_paidbookings, :three_periods
    @report_affamount_3period        ||= Report.new :aff_amount, :three_periods
    @report_affprofit_3period        ||= Report.new :aff_profit, :three_periods
    @report_widget_events_custom     ||= Report.new :widget_events, :custom
    @report_widget_statistics_custom ||= Report.new :widget_statistics, :custom
  end


  get '/dashboard/hourly' do
    @data_widget_events =  @report_widget_events_custom.fetch :custom
    @data_widget_statistics = @report_widget_statistics_custom.fetch :custom



    @data_aff_searches        = @report_affsearches_3period.fetch :hourly
    @data_aff_clicks          = @report_affclicks_3period.fetch :hourly
    @data_aff_paidbookings    = @report_affpaidbookings_3period.fetch :hourly
    @data_aff_amount_3periods = @report_affamount_3period.fetch :hourly
    @data_aff_profit_3periods = @report_affprofit_3period.fetch :daily
    erb :index, :layout => :layout
  end


end

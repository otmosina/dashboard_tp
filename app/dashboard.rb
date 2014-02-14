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

  before '/dashboard/widget_stat' do
    @widget_inits       ||= Report.new :widget_statistics_inits, :three_periods
    @widget_shows       ||= Report.new :widget_statistics_shows, :three_periods
    @widget_leads       ||= Report.new :widget_statistics_leads, :three_periods
    @widget_searches    ||= Report.new :widget_statistics_searches, :three_periods
    @widget_clicks      ||= Report.new :widget_statistics_clicks, :three_periods
    @widget_bookings    ||= Report.new :widget_statistics_bookings, :three_periods
    @widget_profit      ||= Report.new :widget_statistics_profit, :three_periods
  end

  get '/dashboard/widget_stat' do

    @data_widget_inits   = @widget_inits.fetch :hourly
    @data_widget_shows   = @widget_shows.fetch :hourly
    @data_widget_leads   = @widget_leads.fetch :hourly
    @data_widget_searches= @widget_searches.fetch :hourly
    @data_widget_clicks  = @widget_clicks.fetch :hourly
    @data_widget_bookings= @widget_bookings.fetch :hourly
    @data_widget_profit    = @widget_profit.fetch :hourly

    erb :widget_stat, :layout => :layout
  end


end

class Dashboard < Sinatra::Base

  get '/dashboard/custom' do
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

  before do
    @reports = []
  end

  get '/dashboard/hourly' do
    #@reports << { data: Report.fetch( :aff_amount, :three_periods, :hourly ),
    #              title: "Affiliate registration",
    #              step: 1
    #            }
    @reports << { data: Report.fetch( :aff_searches, :three_periods, :hourly ),
                  title: "Searches",
                  step: 2500
                }
    @reports << { data: Report.fetch( :aff_clicks, :three_periods, :hourly ),
                  title: "Clicks",
                  step: 200
                }
    @reports << { data: Report.fetch( :aff_paidbookings, :three_periods, :hourly ),
                  title: "Paid bookings",
                  step: 18
                }


    @reports << { data: Report.fetch( :widget_statistics_inits, :three_periods, :hourly ),
                  title: "Inits widget",
                  step: 10000
               }
    @reports << { data: Report.fetch( :widget_statistics_leads, :three_periods, :hourly ),
                  title: "Leads widget",
                  step: 150
               }
    @reports << { data: Report.fetch( :widget_statistics_searches, :three_periods, :hourly ),
                  title: "Searches widget",
                  step: 150
               }
    @reports << { data: Report.fetch( :widget_statistics_clicks, :three_periods, :hourly ),
                  title: "Clicks widget",
                  step: 20
               }
    @reports << { data: Report.fetch( :widget_statistics_bookings, :three_periods, :hourly ),
                  title: "Bookings widget",
                  step: 2
               }
    @reports << { data: Report.fetch( :widget_paid_bookings_profit, :three_periods, :hourly ),
                  title: "Paid bookings widget",
                  step: 900
               }
    erb :custom_index, :layout => :layout
  end

  get '/dashboard/fifteen' do
    @reports << { data: Report.fetch( :aff_searches, :three_periods, :fifteen_min ),
                  title: "Searches",
                  step: 500
                }
    @reports << { data: Report.fetch( :aff_clicks, :three_periods, :fifteen_min ),
                  title: "Clicks",
                  step: 50
                }
    @reports << { data: Report.fetch( :aff_paidbookings, :three_periods, :fifteen_min ),
                  title: "Paid bookings",
                  step: 6
                }
    erb :custom_index, :layout => :layout

  end

end

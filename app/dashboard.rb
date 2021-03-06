class Dashboard < Sinatra::Base
  before do

  @canvas_height = 450
  @canvas_width = @canvas_height / 9 * 16 #16:9

    @reports = []
    if params[:clear_cache]
      Report.clear_cache
    end

    Report.set_column_count 0
    if params[:count_of_periods]
      Report.set_column_count params[:count_of_periods].to_i
    end
  end


  get '/dashboard/widget_stat' do
    Report.set_column_count 15 if Report.get_column_count == 0
    @reports += [
      {
        data: Report.fetch( :widget_statistics_inits, :three_periods, :hourly ),
        title: "Widget inits",
        step: 10000
      },{
        data: Report.fetch( :widget_statistics_shows, :three_periods, :hourly ),
        title: "Widget shows",
        step: 7000
      },{
        data: Report.fetch( :widget_statistics_leads, :three_periods, :hourly ),
        title: "Widget leads",
        step: 250
      },{
        data: Report.fetch( :widget_statistics_searches, :three_periods, :hourly ),
        title: "Widget searches",
        step: 250
      },{
        data: Report.fetch( :widget_statistics_clicks, :three_periods, :hourly ),
        title: "Widget clicks",
        step: 30
      },{
        data: Report.fetch( :widget_statistics_bookings, :three_periods, :hourly ),
        title: "Widget bookings",
        step: 3
      },{
        data: Report.fetch( :widget_paid_bookings_profit, :three_periods, :hourly ),
        title: "Widget paid bookings",
        step: 800
      },{
        data: Report.fetch( :widget_statistics_profit, :three_periods, :hourly ),
        title: "Widget profit",
        step: 800
      }
    ]

    erb :three_periods, :layout => :layout

  end

  get '/dashboard/daily' do
    Report.set_column_count 20 if Report.get_column_count == 0
    @reports << { data: Report.fetch( :aff_profit, :one_periods, :daily ),
                  title: "Profit",
                  step: 140000
                }
    @reports << { data: Report.fetch( :aff_amount, :one_periods, :daily ),
                  title: "Affiliate registration",
                  step: 20
                }
    @reports << { data: Report.fetch( :aff_searches, :one_periods, :daily ),
                  title: "Affiliate searches",
                  step: 60000
                }
    @reports << { data: Report.fetch( :aff_clicks, :one_periods, :daily ),
                  title: "Affiliate clicks",
                  step: 6000
                }
    @reports << { data: Report.fetch( :aff_bookings, :one_periods, :daily ),
                  title: "Affiliate bookings",
                  step: 600
                }
    @reports << { data: Report.fetch( :aff_paidbookings, :one_periods, :daily ),
                  title: "Affiliate paidbookings",
                  step: 400
                }
    erb :one_period, :layout => :layout

  end

  get '/dashboard/monthly' do
    Report.set_column_count 4 if Report.get_column_count == 0
    @reports << { data: Report.fetch( :aff_profit, :one_periods, :monthly ),
                  title: "Profit",
                  step: 140000
                }
    @reports << { data: Report.fetch( :aff_amount, :one_periods, :monthly ),
                  title: "Affiliate registration",
                  step: 20
                }

    @reports << { data: Report.fetch( :aff_searches, :one_periods, :monthly ),
                  title: "Affiliate searches",
                  step: 60000
                }
    @reports << { data: Report.fetch( :aff_clicks, :one_periods, :monthly ),
                  title: "Affiliate clicks",
                  step: 6000
                }
    @reports << { data: Report.fetch( :aff_bookings, :one_periods, :monthly ),
                  title: "Affiliate bookings",
                  step: 600
                }
    @reports << { data: Report.fetch( :aff_paidbookings, :one_periods, :monthly ),
                  title: "Affiliate paidbookings",
                  step: 400
                }

    erb :one_period, :layout => :layout

  end

  get '/dashboard/hourly' do
    Report.set_column_count 12 if Report.get_column_count == 0
    #@reports << { data: Report.fetch( :aff_amount, :three_periods, :hourly ),
    #              title: "Affiliate registration",
    #              step: 1
    #            }
    @reports += [
      {
        data: Report.fetch( :aff_searches, :three_periods, :hourly ),
        title: "Searches",
        step: 5000
      },{
        data: Report.fetch( :aff_clicks, :three_periods, :hourly ),
        title: "Clicks",
        step: 400
      },{
        data: Report.fetch( :aff_paidbookings, :three_periods, :hourly ),
        title: "Paid bookings",
        step: 18
      },{
        data: Report.fetch( :widget_statistics_inits, :three_periods, :hourly ),
        title: "Inits widget",
        step: 20000
      },{
        data: Report.fetch( :widget_statistics_leads, :three_periods, :hourly ),
        title: "Leads widget",
        step: 1500
      },{
        data: Report.fetch( :widget_statistics_searches, :three_periods, :hourly ),
        title: "Searches widget",
        step: 1500
      },{
        data: Report.fetch( :widget_statistics_clicks, :three_periods, :hourly ),
        title: "Clicks widget",
        step: 60
      },{
        data: Report.fetch( :widget_statistics_bookings, :three_periods, :hourly ),
        title: "Bookings widget",
        step: 5
      },{
        data: Report.fetch( :widget_paid_bookings_profit, :three_periods, :hourly ),
        title: "Paid bookings profit widget",
        step: 1400
      }
    ]

    erb :three_periods, :layout => :layout
  end

  get '/dashboard/fifteen' do
    Report.set_column_count 6 if Report.get_column_count == 0
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
    erb :three_periods, :layout => :layout

  end

  get '/dashboard/custom' do
    Report.set_column_count 24 if Report.get_column_count == 0
    @data_widget_events     = Report.fetch :widget_events, :custom, :custom
    @data_widget_statistics = Report.fetch :widget_statistics, :custom, :custom

    erb :custom, :layout => :layout
  end

  get '/dashboard/cb_wl' do
    Report.set_column_count 15 if Report.get_column_count == 0
        @reports << { data: Report.fetch( :combined_wl_searches, :one_periods, :daily),
                      title: "Searches",
                      step: 3000
                    }
        @reports << { data: Report.fetch( :combined_wl_clicks, :one_periods, :daily),
                      title: "Clicks",
                      step: 300
                    }
        @reports << { data: Report.fetch( :combined_wl_paid_bookings_profit, :one_periods, :daily),
                      title: "Paid bookings Profit",
                      step: 8000
                    }
        @reports << { data: Report.fetch( :combined_wl_bookings, :one_periods, :daily),
                      title: "Bookings",
                      step: 50
                    }
        @reports << { data: Report.fetch( :combined_wl_registration, :one_periods, :daily),
                      title: "Registrations",
                      step: 3
                    }
        @reports << { data: Report.fetch( :combined_wl_active_wl, :one_periods, :daily),
                      title: "Active cb_wl",
                      step: 40
                    }
        erb :one_period, :layout => :layout
  end

  get '/dashboard/wl' do
    Report.set_column_count 15 if Report.get_column_count == 0
        @reports << { data: Report.fetch( :whitelabels_searches, :one_periods, :daily),
                      title: "Searches",
                      step: 8000
                    }
        @reports << { data: Report.fetch( :whitelabels_clicks, :one_periods, :daily),
                      title: "Clicks",
                      step: 600
                    }
        @reports << { data: Report.fetch( :whitelabels_paid_bookings_profit, :one_periods, :daily),
                      title: "Paid bookings Profit",
                      step: 15000
                    }
        @reports << { data: Report.fetch( :whitelabels_bookings, :one_periods, :daily),
                      title: "Bookings",
                      step: 50
                    }
        #@reports << { data: Report.fetch( :whitelabels_registration, :one_periods, :daily),
                     # title: "Registrations",
                     # step: 1
                    #}

        erb :one_period, :layout => :layout
  end


end

require 'sinatra/base'
require 'rest-client'
require 'oj'
require 'pry'
require 'yaml'

$:.unshift File.dirname(__FILE__)


require 'singleton'

require 'lib/report'
require 'lib/report3'
require 'lib/reports/widget_events_report'
require 'lib/reports/widget_statistics_report'
require 'lib/reports/custom_report'
require 'lib/reports/three_periods_report.rb'
require 'lib/reports/one_periods_report.rb'
require 'app/dashboard'
require 'app/detailed_dashboard'

class DashboardEndpoint < Sinatra::Base
  set :port, 8080
  set :logging, true
  set :static, true
  set :public_folder, File.dirname(__FILE__) + '/public'

  #set :public, File.dirname(__FILE__) + '/public'#'public/javascript'
  #set :public, File.dirname(__FILE__) + '/public/javascript'
  get '/javascripts/application.js' do
    content_type 'application/javascript'
    js = File.read("public/javascript/application.js")
    js
  end

  use Dashboard
  use DetailedDashboard
end
DashboardEndpoint.run!


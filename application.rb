require 'sinatra/base'
require 'rest-client'
require 'oj'
require 'pry'
require 'yaml'

$:.unshift File.dirname(__FILE__)

require 'lib/report'
require 'lib/reports/widget_report'
require 'app/dashboard'

class DashboardEndpoint < Sinatra::Base
  set :port, 9292
  set :logging, true
  set :public_folder, File.dirname(__FILE__) + '/public'
  use Dashboard
end
#DashboardEndpoint.run!


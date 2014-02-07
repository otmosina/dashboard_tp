require 'sinatra/base'
require 'rest-client'
require 'oj'
require 'pry'
require 'yaml'

$:.unshift File.dirname(__FILE__)

require 'lib/report'
require 'lib/reports/widget_report'
require 'lib/reports/affprofit_report'
require 'lib/reports/affstatistic_report'
require 'app/dashboard'

class DashboardEndpoint < Sinatra::Base
  set :port, 9292
  set :logging, true
  set :public_folder, File.dirname(__FILE__) + '/public'
  #set :static, true
  #set :public, 'public/javascript'
  #set :public, File.dirname(__FILE__) + '/public/javascript'
  get '/javascripts/application.js' do
    content_type 'application/javascript'
    js = File.read("public/javascript/application.js")
    js
  end
  use Dashboard
end
#DashboardEndpoint.run!


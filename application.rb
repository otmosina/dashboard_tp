require 'sinatra/base'
require 'rest-client'
require 'oj'
require 'pry'
require 'yaml'

$:.unshift File.dirname(__FILE__)

require 'lib/report'
require 'app/dashboard'
require 'app/detailed_dashboard'
require 'hiredis'
require 'redis'
require 'redis/connection/hiredis'

$redis = Hiredis::Connection.new
$redis.connect("127.0.0.1", 6379)

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


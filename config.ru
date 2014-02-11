require 'bundler/setup'

require File.expand_path('../application.rb', __FILE__)

#run Dashboard
#nginx: master process /opt/nginx/sbin/nginx -c conf/nginx.conf
#ruby dashboard.rb -p8080
run DashboardEndpoint

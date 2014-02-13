class DetailedDashboard < Sinatra::Base
  get '/detailed_dashboard' do
    erb :detailed_index
  end

end

require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    p 'get'
    @peeps = [
      {:post => 'This should be at the bottom', :post_age => 3},
      {:post => 'This should be in the middle', :post_age => 2},
      {:post => 'This should be at the top', :post_age => 1}
    ].sort { |a, b| a[:post_age] <=> b[:post_age]}
    erb :'chitter/index'
  end

  post '/chitter' do
    p 'put'
    erb :'chitter/index'
  end

  run! if app_file == $0
end

require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb :'chitter/index'
  end

  post '/chitter' do
    @peep = Peep.create(peep: params[:peep]).peep
    erb :'chitter/index'
  end

  run! if app_file == $0
end

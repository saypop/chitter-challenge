require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'
require './lib/lapsed_time'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all
    # p @peeps[0]
    # p LapsedTime.calculate(@peeps[0])
    erb :'chitter/index'
  end

  post '/chitter' do
    erb :'chitter/index'
  end

  run! if app_file == $0
end

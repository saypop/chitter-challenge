require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'
require './lib/lapsed_time'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    redirect '/chitter'
  end

  post '/chitter' do
    Peep.create(post: params[:post])
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :'chitter/index'
  end

  get '/chitter/register' do
    erb :'chitter/registration/start'
  end

  post '/chitter/register' do
    @user = {:name => 'John', :surname => 'Doe', :handle => 'TheRealJohnDoe'}
    erb :'chitter/registration/success'
  end

  post '/chitter/:handle' do
    Peep.create(post: params[:post])
    path = "/chitter/#{params[:handle]}"
    redirect path
  end

  get '/chitter/:handle' do
    @user = {:name => 'John', :surname => 'Doe', :handle => 'TheRealJohnDoe'}
    @peeps = Peep.all
    erb :"chitter/signed_in"
  end

  run! if app_file == $0
end

require 'sinatra/base'
#require './lib/game.rb'
require 'byebug'
require 'data_mapper'
require './lib/link.rb'

class App < Sinatra::Base
 set :views, proc {File.join(root, '..', 'views')}
 enable :sessions
 set :session_secret, '123454321'
 use Rack::Session::Pool
 env = ENV['RACK_ENV'] || "development"


 DataMapper.setup(:default, "postgres://localhost/my_app_#{env}")

 DataMapper.finalize

 DataMapper.auto_upgrade!


 get '/' do
   erb :index
 end

 # start the server if ruby file executed directly
 run! if app_file == $0
end
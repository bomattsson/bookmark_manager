require 'sinatra/base'
#require './lib/game.rb'
require 'byebug'
require 'data_mapper'
require './lib/link.rb'

class App < Sinatra::Base
<<<<<<< HEAD
 set :views, proc {File.join(root, '..', 'views')}
 enable :sessions
 set :session_secret, '123454321'
 use Rack::Session::Pool
 env = ENV['RACK_ENV'] || "development"


 DataMapper.setup(:default, "postgres://localhost/my_app_#{env}")

 DataMapper.finalize

 DataMapper.auto_upgrade!

=======
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions
>>>>>>> 04ab4dca1cc72c15f72ded862caf72cfa9f1e414

  get '/' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

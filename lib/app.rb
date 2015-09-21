require 'sinatra/base'
#require './lib/game.rb'
require 'byebug'

class App < Sinatra::Base
 set :views, proc {File.join(root, '..', 'views')}
 enable :sessions

 get '/' do
   erb :index
 end

 # start the server if ruby file executed directly
 run! if app_file == $0
end
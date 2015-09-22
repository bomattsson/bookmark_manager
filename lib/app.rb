require 'sinatra/base'
require 'byebug'
require 'data_mapper'
require 'dm-migrations'
require './lib/link.rb'

class App < Sinatra::Base
  # helpers Sinatra::FormHelpers
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions
  set :session_secret, '123321123'
  use Rack::Session::Pool
  env = ENV['RACK_ENV'] || "development"
  DataMapper.setup(:default, "postgres://localhost/bookmark_web_#{env}")
  # DataMapper::Logger.new($stdout, :debug)
  DataMapper.finalize
  DataMapper.auto_upgrade!

  get '/' do
    @links = Link.all
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

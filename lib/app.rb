require 'sinatra/base'
# require 'byebug'
# require 'pry'
require 'tilt/erb' # Need here?
require 'data_mapper'
require 'dm-migrations'
require './lib/link.rb'
require './lib/user.rb'

class App < Sinatra::Base
  # helpers Sinatra::FormHelpers
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions
  set :session_secret, '123321123'
  use Rack::Session::Pool
  env = ENV['RACK_ENV'] || "development"
  # DataMapper.setup(:default, "postgres://localhost/bookmark_web_#{env}")
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_web_#{env}")

  # DataMapper::Logger.new($stdout, :debug)
  DataMapper::Model.raise_on_save_failure = true
  DataMapper.auto_upgrade!
  DataMapper.finalize



  get '/' do
    @links = Link.all(order: [ :created_at.desc ])
    erb :index
  end

  get '/links' do
    @links = Link.all(order: [ :created_at.desc ])
    erb :'links/index'
  end

  post '/link' do
    if((params[:title] == '') || (params[:url] == ''))
      redirect '/links/new'
    else
      new_link = Link.new
      new_link.title = params[:title]
      new_link.url = params[:url]
      new_link.description = params[:description]
      new_link.created_at = Time.now
      new_link.save
      redirect '/links'
    end
  end

  get '/links/new' do
    erb :'links/new'
  end

   get '/users/new' do
    erb :'users/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

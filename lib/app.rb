require 'sinatra/base'
# require 'byebug' # When I deployed to Heroku for the first time and went to the page http://bmm1.herokuapp.com it showed an error message and said to check the logs ($ heroku logs), which I did.  Near the top of the logs I found this: "2015-09-23T19:38:11.409113+00:00 app[web.1]: /app/lib/app.rb:2:in `require': cannot load such file -- byebug (LoadError)"  So I'm testing commenting out this line.
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
  DataMapper.setup(:default, "postgres://localhost/bookmark_web_#{env}")
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

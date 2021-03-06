class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :'songs/index'
  end

  get '/artists' do
    erb :'artists/index'
  end

  get '/genres' do
    erb :'genres/index'
  end


  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
      
    if Artist.find_by(name: params[:artist][:name])
      @song.artist = Artist.find_by(name: params[:artist][:name])
    else 
      @song.artist = Artist.create(params[:artist])
    end

    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])
    erb :'songs/show'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])
    redirect :'songs/show'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params["slug"])
    erb :'artists/show'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params["slug"])
    erb :'genres/show'
  end


end
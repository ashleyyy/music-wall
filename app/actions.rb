# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs/new' do
  erb :'/songs/new'
end

get '/songs/show' do
  erb :'songs/show'
end

get '/songs/' do
  erb :'songs/index'
end

post '/songs' do
  @song = Song.new(
    song_title: params[:song_title],
    author: params[:author], 
    url: params[:url]
  )
  if @song.save
    redirect '/songs/'
  else
    erb :'songs/new'
  end
end


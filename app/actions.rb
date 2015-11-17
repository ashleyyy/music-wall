# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs/new' do
  erb :'/songs/new'
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  erb :'songs/show'
end

get '/songs/' do
  @songs = Song.all
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

#voting stuff
post '/votes' do
  @vote = Vote.new(
  user_id: params[:user_id],
  song_id: params[:song_id]
  )
  if @vote.save
    redirect '/songs/'
  else
    "It is a Strange and Beautiful World"
  end
end

get '/login' do
  erb :'/login'
end

post '/login' do
  @user = User.find_by(username: params[:username], password: params[:password])
   if @user
     session[:user_id] = @user.id
     redirect '/songs/'
   else
     Errors!
   end
 end

post '/signup' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/songs/'
    else 
      Errors!
    end
end






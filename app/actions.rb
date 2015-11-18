# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs/new' do
  erb :'/songs/new'
end

get '/songs/topten/' do
  erb :'/songs/topten'
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
    url: params[:url],
    user_id: params[:user_id]
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
    @song = Song.find(params[:song_id])
    erb :'songs/show'
  else
    @song = Song.find(params[:song_id])
    erb :'songs/show'
  end
end

post '/reviews' do
  @review = Review.new(
  user_id: params[:user_id],
  song_id: params[:song_id],
  content: params[:content]
  )
  if @review.save
    redirect back
  else
    redirect back
  end
end

post '/deletereview' do
  doomedreview = Review.find_by(id: params[:review_id])
  doomedreview.destroy if doomedreview
  redirect back
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
      "Errors!"
    end
end

get '/logout' do
   if session[:user_id]
     session.clear
     redirect '/login'
   else
     "Errors!"
   end
 end





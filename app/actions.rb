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



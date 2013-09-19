enable :sessions

############### GETS ####################

get '/' do
  erb :index
end

get '/logout' do
  session[:email] = nil
  erb :index
end

get '/secret' do
  erb :secret_page
end

############### POSTS ####################

post '/create_users' do
  user = User.create(params[:user])
  if user.valid?
    session[:email] = params[:user][:email]
    erb :secret_page
  else
    redirect to '/'
  end
end

post '/login' do
  if User.authenticate(params[:user][:email], params[:user][:password])
    session[:email] = params[:user][:email]
    erb :secret_page
  else
    erb :index
  end
end


# User.authenticate(email, password)

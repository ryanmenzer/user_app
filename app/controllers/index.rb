############### GETS ####################

get '/' do
  # Look in app/views/index.erb
  erb :index
end



############### POSTS ####################

post '/create_users' do
  user = User.create(params[:user])
  if user.valid?
    erb :secret_page
  else
    redirect to '/'
  end
end

post '/login' do
  if User.authenticate(params[:user][:email], params[:user][:password])
    p 'hello'
  else
    p 'no'
  end
end


# User.authenticate(email, password)

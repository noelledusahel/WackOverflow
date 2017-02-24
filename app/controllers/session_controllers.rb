enable :sessions

get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:user][:username], params[:user][:password])
  if @user
    set_user(@user)
    redirect "/"
  else
    status 422
    @errors = ["Login failed"]
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  if request.xhr?
    200
    erb :_navbar, layout: false
  else
    redirect '/'
  end
end


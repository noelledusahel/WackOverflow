enable :sessions

get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do

  @user = User.authenticate(params[:user][:username], params[:user][:password])
  p @user
  if request.xhr?
    if @user
      set_user(@user)
      erb :_navbar_log_out, layout: false
    else
      status 422
      @errors = ["Login failed"]
      erb :'/sessions/new'
    end
  else
    if @user
      set_user(@user)
      redirect "/"
    else
      status 422
      @errors = ["Login failed"]
      erb :'/sessions/new'
    end
  end
end

delete '/sessions' do
  session.delete(:user_id)
  if request.xhr?
    200
    erb :_navbar_log_in, layout: false
  else
    redirect '/'
  end
end


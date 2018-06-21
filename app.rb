require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
require './model'

enable :sessions

get '/' do
    @tweets = Tweet.all
    @users = User.all
    if session[:email]
        erb :index
    else
        redirect '/login'
    end
end

get '/create' do
    Tweet.create(
        email: params[:email],
        content: params[:content]
        )
     redirect '/'
end

get '/signup' do
    @users = User.all
    erb :signup
end

get '/resister' do
    User.create(
        email: params[:email],
        password: params[:password]
        )
    redirect '/'
end

get '/admin' do
    @users = User.all
    erb :admin
end

get '/login' do
    erb :login
end

get '/login_session' do

   @users = User.all
   #로그인에서 날아온 정보로 DB의 정보와 비교하는 로직
   @msg = "로그인 실패 DB에 없음"
   @users.each do |u|
      if u.email == params[:email] && u.password == params[:password]
          @msg = "로그인 성공"
          session[:email] = u.email
      end

   end
  erb :login_session
end

get '/logout' do
    session.clear
    redirect '/'
end
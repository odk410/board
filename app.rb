require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
require './model.rb'

set :bind, '0.0.0.0'

enable :sessions

 # Before Filter
 # 사전에 로그인 해야 사용이 가능하다.
before do
  check_login
end

get '/' do
  @posts = Post.all

  erb :index
end

get '/new' do

  erb :new
end

# CRUD
# C: 생성
get '/create' do

  # 글을 DB에 저장하고
  # 루트 페이지 '/'로 redirect해준다.

  Post.create(
    :title => params["title"],
    :content => params["content"]
  )

  redirect to '/'
end

# D: 삭제
get '/destroy/:id' do
  # 1번 글을 지우게 될 경우
  # '/destroy/5'로 된다.
  # 삭제 기능
  post = Post.get(params[:id])
  post.destroy

  redirect to '/'

end


get '/edit/:id' do
  @post = Post.get(params[:id])
  erb :edit
end

# U: 업데이트
get '/update/:id' do
  post = Post.get(params[:id])
  post.update(
    :title => params[:title],
    :content => params[:content]
  )

  redirect to '/'
end

get '/signup' do
  erb :signup
end

get '/register' do
  User.create(
    :email => params["email"],
    :password => params["password"]
  )

  redirect to '/'
end

get 'login' do
  erb :login
end

get 'login_session' do
  if User.first(:email => params["email"])
  end
end

# 로그인이 되었는지 확인하는 함수
def check_login
  unless session[:email]  # Session에 email이 없다면
    redirect to '/'
  end
end

get '/hello/:name' do
  @name = params[:name]
  erb :hello
end

get '/square/:num' do
  num = params[:num].to_i
  @result = num ** 2
  erb :square
end

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('../models/user')
require_relative('../models/book')
also_reload('./models')



get '/admin' do
  @users = User.find_all()
  erb(:"users/admin")
end

get '/admin/new' do
  erb(:"users/new")
end
post '/admin/create' do
   @user = User.new(params)
   @user.save()
   redirect '/admin'
end

post '/admin/:id/delete' do
  @user = User.find(params[:id])
  @user.delete_by_id()
  redirect '/admin'
end

get '/admin/:id/collection' do
  @user = User.find(params['id'].to_i)
  erb(:"books/index")
end

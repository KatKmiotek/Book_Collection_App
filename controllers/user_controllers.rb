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

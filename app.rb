require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('controllers/books_controller')
require_relative('controllers/users_controller')
require_relative('./models/user')
require_relative('./models/book')
also_reload('./models')




get '/' do
  @user = User.find(1)
  erb(:index)
end


#error handling TODO
error '/collection/:id/delete' do
  'This is nowhere to be found.'
end

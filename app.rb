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

#sorting:

get '/collection/byauthor/' do
    @user = User.find(1)
    erb(:"books/books_by_author")
end
get '/collection/bystatus/' do
  @user = User.find(1)
  erb(:"books/books_by_status")
end
get '/collection/bytitle/' do
  @user = User.find(1)
  erb(:"books/books_by_title")
end
get '/collection/bylocation/' do
  @user = User.find(1)
  erb(:"books/books_by_location")
end
get '/about' do
  erb(:about)
end

#search for general data
# post '/collection/search/' do
#   @books = Book.search(params[:search])
#   erb(:"books/search_result")
# end

#search in user's data
post '/collection/search/' do
  @user = User.find(1)
  erb(:"books/search_result")
end

#error handling TODO
error '/collection/:id/delete' do
  'This is nowhere to be found.'
end

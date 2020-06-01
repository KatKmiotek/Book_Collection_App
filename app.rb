require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/user')
require_relative('./models/book')
also_reload('./models')


get '/' do
  erb( :user )
end

post '/home' do
  @books = Book.find_all()
  @user = User.new(params)
  erb(:index)
end

get '/home' do
  @books = Book.find_all()
  @user = User.new(params)
  erb(:index)
end

post '/collection' do
  @books = Book.find_all()
  erb(:"books/index")
end

get '/collection' do
  @books = Book.find_all()
  erb(:"books/index")
end

get '/collection/:id' do
  @book = Book.find_by_id(params['id'].to_i)
  erb(:"books/show")
end

post '/new' do
  erb(:new)
end
get '/new' do
  erb(:new)
end

post '/create' do
   @book = Book.new(params)
   @book.save()
   erb(:create)
end

get '/create' do
  redirect to (:index)
end
post '/collection/:id/delete' do
  @book = Book.find_by_id(params[:id])
  @book.delete_by_id
  erb(:delete)
end

get '/collection/:id/edit' do
  @book = Book.find_by_id(params[:id])
  erb(:edit)
end

post '/collection/:id' do
  @book = Book.new(params)
  @book.update()
  erb(:update)
end

get '/collection/byauthor/' do
    @books = Book.find_all_by_author()
    erb(:"books/books_by_author")
end

get '/collection/bystatus/' do
  @books = Book.find_all_by_status()
  erb(:"books/books_by_status")
end
get '/collection/bytitle/' do
  @books = Book.find_all_by_title()
  erb(:"books/books_by_title")
end
get '/collection/bylocation/' do
  @books = Book.find_all_by_location()
  erb(:"books/books_by_location")
end
get '/about' do
  erb(:about)
end


#error handling TODO
error '/collection/:id/delete' do
  'This is nowhere to be found.'
end

require_relative('../db/sql_runner')
require_relative('./book')

class User

attr_reader :id
attr_accessor :name

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
end

def save()
  sql = "INSERT INTO users (name) VALUES ($1) RETURNING id"
  values = [@name]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i
end

def update()
  sql = "UPDATE users SET(name) = ($1)
  WHERE id = $2"
  values =[@name, @id]
  SqlRunner.run(sql, values)
end

def delete_by_id()
  sql = "DELETE FROM users WHERE id = $1"
  values= [@id]
  SqlRunner.run(sql, values)
end
#joining
def books()
    sql = "SELECT books.* FROM books INNER JOIN users ON users.id = books.user_id WHERE users.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |book| Book.new(book) }
end
# uder's data sorting:
def find_all_by_author()
  sql = "SELECT books.* FROM books INNER JOIN users ON users.id = books.user_id WHERE users.id = $1 ORDER BY author"
  values =[@id]
  result = SqlRunner.run(sql, values)
  books = result.map { |book| Book.new(book) }
  return books
end

def find_all_by_title()
  sql = "SELECT books.* FROM books INNER JOIN users ON users.id = books.user_id WHERE users.id = $1 ORDER BY title"
  values =[@id]
  result = SqlRunner.run(sql, values)
  books = result.map { |book| Book.new(book) }
  return books
end

def find_all_by_location()
  sql = "SELECT books.* FROM books INNER JOIN users ON users.id = books.user_id WHERE users.id = $1 ORDER BY location DESC"
  values =[@id]
  result = SqlRunner.run(sql, values)
  books = result.map { |book| Book.new(book) }
  return books
end

def find_all_by_status()
  sql = "SELECT books.* FROM books INNER JOIN users ON users.id = books.user_id WHERE users.id = $1 ORDER BY status DESC"
  values =[@id]
  result = SqlRunner.run(sql, values)
  books = result.map { |book| Book.new(book) }
  return books
end
#
#search in user's data
def search(input)
  sql = "SELECT * FROM books WHERE (lower(author) LIKE $1) OR (lower(title) LIKE $1) OR (lower(comment) LIKE $1)"
  values = ["%#{input}%"]
  result = SqlRunner.run(sql, values)
  books = result.map { |book| Book.new(book) }
  return books
end

def self.find_all()
  sql = "SELECT * FROM users"
  result = SqlRunner.run(sql)
  return result.map { |user| User.new(user) }
end

def self.find( id )
    sql = "SELECT * FROM users
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return User.new( results.first )
end

def self.delete_all()
  sql = "DELETE FROM users"
  SqlRunner.run(sql)
end












end

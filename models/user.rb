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

def books()
    sql = "SELECT books FROM books INNER JOIN users ON user.id = books.user_id WHERE user.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |book| Book.new(book) }
end
#below to edit
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

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

def books()
    sql = "SELECT * FROM users JOIN books ON user.id = books.user_id"
    result = SqlRunner.run(sql)
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

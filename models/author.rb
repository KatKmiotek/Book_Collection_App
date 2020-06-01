require_relative('../db/sql_runner')
require_relative('./book')
require_relative('./user')

class Author

# TODO: is it needed?


def books()
  sql = "SELECT * FROM books INNER JOIN authors ON authors.id = books.author_id WHERE author_id = $1"
  values = [@id]
  result = SqlRunner.run(sql, values)
  return result.map { |book| Book.new(book) }
end

def self.delete_all()
  sql = "DELETE FROM authors"
  SqlRunner.run(sql)
end

def self.find_all()
  sql = "SELECT * FROM authors"
  result = SqlRunner.run(sql)
  authors = result.map { |author| Author.new(author) }
  return authors
end

def self.find_by_id(id)
  sql = "SELECT * FROM authors WHERE id = $"
  values =[id]
  result = SqlRunner.run(sql, values)
  return Author.new(result.first)
end










end

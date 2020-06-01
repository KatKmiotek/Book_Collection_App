require_relative('../db/sql_runner')
require_relative('./book')
require_relative('./author')

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


def self.delete_all()
  sql = "DELETE FROM users"
  SqlRunner.run(sql)
end












end

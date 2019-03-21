require_relative('../db/sql_runner')
require_relative('./house')

class Student

  attr_reader :id
  attr_accessor :first_name, :second_name, :house_id, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def house()
    sql = 'SELECT name FROM houses
    WHERE id = $1'
    values = [@house_id]
    result = SqlRunner.run(sql, values).first
    return House.new(result)
  end

  def save()
    sql = 'INSERT INTO students (first_name, second_name, house_id, age)
      VALUES ($1, $2, $3, $4)
      RETURNING id'
      values = [@first_name, @second_name, @house_id, @age]
      @id = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM students'
    return SqlRunner.run(sql).map { |data| Student.new(data)  }
  end

  def self.find(id)
    sql = 'SELECT * FROM students WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Student.new(result)
  end

  def delete
    sql = 'DELETE FROM students
    WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end
end

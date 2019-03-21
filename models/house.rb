class House
  attr_reader :name, :logo, :id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = 'INSERT INTO houses (name)
      VALUES ($1)
      RETURNING id'
      values = [@name]
      @id = SqlRunner.run(sql, values)
  end

  def self.all()
      sql = 'SELECT * FROM houses'
      return SqlRunner.run(sql).map { |data| House.new(data)  }
  end

  def self.find(id)
    sql = 'SELECT * FROM houses
    WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values).first
    return House.new(result)
  end

end

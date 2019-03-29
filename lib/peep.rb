class Peep

  attr_reader :id, :post, :timestamp

  def initialize(id: id, post: post, timestamp: timestamp)
    @id = id
    @post = post
    @timestamp = timestamp
  end

  def self.create(post: post)
    result = DatabaseConnection.query("INSERT INTO peeps (post) VALUES('#{post}') RETURNING id, post, timestamp")
    Peep.new(id: result[0]['id'], post: result[0]['post'], timestamp: Time.parse(result[0]['timestamp']))
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    list = result.map do |peep|
      Peep.new(id: peep['id'], post: peep['post'], timestamp: peep['timestamp'])
    end
    list.sort! { |a, b| b.timestamp <=> a.timestamp }
  end

end

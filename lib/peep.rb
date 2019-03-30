class Peep

  attr_reader :id, :post, :timestamp

  def initialize(id:, post:, timestamp:)
    @id = id
    @post = post
    @timestamp = timestamp
  end

  # def timestamp
  #   DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{Self.id}")
  # end

  def self.create(post:, timestamp: Time.now)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (post, timestamp) VALUES('#{post}', '#{timestamp}') RETURNING id, post, timestamp"
    )
    Peep.new(
      id: result[0]['id'],
      post: result[0]['post'],
      timestamp: Time.parse(result[0]['timestamp']))
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    list = result.map do |peep|
      Peep.new(id: peep['id'], post: peep['post'], timestamp: Time.parse(peep['timestamp']))
    end
    list.sort! { |a, b| b.timestamp <=> a.timestamp }
  end

end

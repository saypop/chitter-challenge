class Peep

  attr_reader :id, :peep, :timestamp

  def initialize(id: id, peep: peep, timestamp: timestamp)
    @id = id
    @peep = peep
    @timestamp = timestamp
  end

  def self.create(peep: peep)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, timestamp")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], timestamp: Time.parse(result[0]['timestamp']))
  end

end

require_relative 'peep'

class LapsedTime

  def self.calculate(peep)
    time_diff = Time.now - (peep.timestamp)
    return "#{time_diff.to_i} seconds ago" if time_diff < 120
    return "#{(time_diff/60).to_i} minutes ago" if time_diff < 120 * 60
    return "#{(time_diff/(60 * 60)).to_i} hours ago" if time_diff < 120 * 60 * 60
    return "#{(time_diff/(60 * 60 * 24)).to_i} days ago" if time_diff < 120 * 60 * 60 * 24
    return "#{(time_diff/(60 * 60 * 24 * 30)).to_i} months ago" if time_diff < 120 * 60 * 60 * 24 * 30
    return "#{(time_diff/(60 * 60 * 24 * 30 * 365)).to_i} years ago" if time_diff < 120 * 60 * 60 * 24 * 30 * 365
  end

end

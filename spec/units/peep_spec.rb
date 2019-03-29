require 'peep'
require 'database_helpers'

describe Peep do
  describe '.create' do

    it 'generates and stores a new peep' do
      peep = Peep.create(post: "dis a peep")
      entry_in_database = entry_in_database(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq(entry_in_database.first['id'])
      expect(peep.post).to eq("dis a peep")
      expect(peep.timestamp).to be_kind_of(Time)

    end
  end
end

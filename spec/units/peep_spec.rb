require 'peep'
require 'database_helpers'
require 'test_helpers'

describe Peep do
  describe '.create' do

    it 'generates and stores a new peep' do
      peep = Peep.create(post: "dis a peep")
      entry_in_database = entry_in_database(id: peep.id, table: "peeps")

      expect(peep).to be_a Peep
      expect(peep.id).to eq(entry_in_database.first['id'])
      expect(peep.post).to eq("dis a peep")
      expect(peep.timestamp).to be_kind_of(Time)

    end
  end

  describe '.all' do

    it 'returns a chronological array off all peeps' do
      Timecop.freeze(Time.now - 30)
      peep_t0 = Peep.create(post: "dis a peep")
      Timecop.return
      Timecop.freeze(Time.now - 15)
      peep_t2 = Peep.create(post: "dis a peep 2 secs later")
      Timecop.return
      peep_t4 = Peep.create(post: "dis a peep 4 secs later")
      expect(Peep.all[0].post).to eq(peep_t4.post)
      expect(Peep.all[1].post).to eq(peep_t2.post)
      expect(Peep.all[2].post).to eq(peep_t0.post)
    end

  end

end

require 'lapsed_time'

describe LapsedTime do

  describe '.calculate' do
    it 'returns the time lapsed in seconds for peeps less than 2 minutes old' do
      Timecop.freeze(Time.now - 30)
      peep = create_peep
      Timecop.return
      expect(LapsedTime.calculate(peep)).to include('seconds ago')
    end

    it 'returns the time lapsed in minutes for peeps less than 2 hours old' do
      Timecop.freeze(Time.now - 30 * 60)
      peep = create_peep
      Timecop.return
      expect(LapsedTime.calculate(peep)).to include('minutes ago')
    end

    it 'returns the time lapsed in hours for peeps less than 2 days old' do
      Timecop.freeze(Time.now - 30 * 60 * 60)
      peep = create_peep
      Timecop.return
      expect(LapsedTime.calculate(peep)).to include('hours ago')
    end

    it 'returns the time lapsed in days for peeps less than 2 months old' do
      Timecop.freeze(Time.now - 30 * 60 * 60 * 24)
      peep = create_peep
      Timecop.return
      expect(LapsedTime.calculate(peep)).to include('days ago')
    end

    it 'returns the time lapsed in months for peeps less than 2 years old' do
      Timecop.freeze(Time.now - 30 * 60 * 60 * 24 * 30)
      peep = create_peep
      Timecop.return
      expect(LapsedTime.calculate(peep)).to include('months ago')
    end

    it 'returns the time lapsed in years for peeps more than 2 years old' do
      Timecop.freeze(Time.now - 30 * 60 * 60 * 24 * 30 * 365)
      peep = create_peep
      Timecop.return
      expect(LapsedTime.calculate(peep)).to include('years ago')
    end
  end
end

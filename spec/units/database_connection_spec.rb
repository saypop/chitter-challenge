require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do

    it 'sets up a connection on PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup(dbname: 'chitter_test')
    end

    it 'stores a connection to a database' do
        connection = DatabaseConnection.setup(dbname: 'chitter_test')
        expect(DatabaseConnection.connection).to eq(connection)
    end

  end

  describe '.query' do

    it 'executes a line of SQL on a database' do
      DatabaseConnection.setup(dbname: 'chitter_test')
      expect(DatabaseConnection.connection).to receive(:exec).with("SELECT * FROM peeps")
      DatabaseConnection.query("SELECT * FROM peeps")
    end

  end

end

require 'pg'
require 'database_connection'

def setup_test_database
  p "Setting up test database..."
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE peeps;")
end

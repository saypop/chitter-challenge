require 'pg'
require 'database_connection'

def entry_in_database(id:)

  DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id};")

end

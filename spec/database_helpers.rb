require 'pg'
require 'database_connection'

def entry_in_database(id: id, table: table)

  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = #{id};")

end

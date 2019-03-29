require 'pg'



def entry_in_database(id:)

  DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id};")

end

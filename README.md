# Chitter Challenge

## Instructions:
### Installation:
#### Database:
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_peeps_table.sql
5. Create the database using the psql command CREATE DATABASE chitter_test;
6. Repeat steps 3 to ...

### Usage:

### Testing:

## Challenge:

Our week 4 challenge at Makers Academy was to write a Twitter clone. Features of this clone needed to include:
1. Being able to view all peeps (even when not logged in).
2. User creation with an email, password, name and username.
3. Usernames and emails need to be unique (i.e. a user cannot sign up twice with the same email address and two users can't share a user name).
4. Peeps need to have the username and name of the user displayed with them.
5. A README with a list of all tech used and instrcutions for usage and testing.

### User Stories:

#### User Story 1
```
  As a Maker
  So that I can let people know what I am doing
  I want to post a message (peep) to chitter
```
To satisfy this user story I am going to create a database called Chitter with a table called Peeps. Bearing in mind that I will need to have the username and name of the author displayed on the peep, I will include a field for user id in the table. Also because I will need to order peeps by time, I will include a timestamp too. So:
id  |peep   |user_id   |timestamp
--|---|--|--
1  |"The first ever peep"   |1   |2019/03/29 10:00
2  |"What is this?"   |2   |2019/03/29 10:01
3  |"It's Chitter!"   |1   |2019/03/29 10:03
I will also set a character limit, so that peeps don't get to long and bore users.

Here is a domain model for this user story:
![alt text](images/DM_User_Story_1.png)

Before I tackled the second user story which I set up the testing environment to make executing over connections easier. Below is a short guide to setting this up:
1.  Create a file called setup_test_database.rb in the spec folder.
2.  Insert the following code:
```
  require 'pg'

  def setup_test_database
    p "Setting up test database..."
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE peeps;")
  end
```
3.  Insert the following code at the top of spec_helper.rb
```
  require_relative './setup_test_database'
  ENV['ENVIRONMENT'] = 'test'
  RSpec.configure do |config|
    config.before(:each) do
      setup_test_database
    end
  end
```
4.  Create a file called database_connection.rb in the lib folder.
5.  Insert the following code:
```
  require 'pg'
  class DatabaseConnection
    def self.setup(dbname:)
      @connection = PG.connect(dbname)
    end
    def self.connection
      @connection
    end
    def self.query(sql_query)
      @connection.exec(sql_query)
    end
  end
```
6.  Create a file called database_connection_setup.rb in the root.
7.  Insert this code:
```
  require './lib/database_connection'

  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup(dbname: 'chitter_test')
  else
    DatabaseConnection.setup(dbname: 'chitter')
  end
```
8.  Insert `require './database_connection_setup'` at the top of the app file.

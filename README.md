# DOTA 2 Counter-Picker
## Overview

  DOTA 2 Counter-Picker is an application that allows a user to select up to 5 opposing heros and returns a list of 5 counter picks for each opposing hero.  The application uses an MVC (Model/View/Controller) design.

## Technology

  HTML
  CSS
  BootStrap
  JavaScript
  jQuery
  Ruby

  Sinatra
  PG
  Sinatra ActiveRecord
  Nokigiri
  BCrypt
  Open-URI

## ERD (Entity-Relationship Digram)

USERS|
-----|-------|----------
PK  | id  | SERIAL PRIMARY KEY
    |user_name| varchar(255)
    |user_email| varchar(255)
    |password_hash|varchar(255)
    |password_salt|varchar(255)

HEROCOUNTER|
------------|-----------|----------
PK          |id         | SERIAL PRIMARY KEY
            |name       |varchar(255)
            |imageurl   |varchar(255)
            |counter1   |varchar(255)
            |counterimageurl1|varchar(255)
            |counter2   |varchar(255)
            |counterimageurl2|varchar(255)
            |counter3   |varchar(255)
            |counterimageurl3|varchar(255)
            |counter4   |varchar(255)
            |counterimageurl4|varchar(255)
            |counter5   |varchar(255)
            |counterimageurl5|varchar(255)
            |counter6   |varchar(255)
            |counterimageurl6|varchar(255)
            |counter7   |varchar(255)
            |counterimageurl7|varchar(255)
            |counter8   |varchar(255)
            |counterimageurl8|varchar(255)

## Approach





#### Model

  - Postgres SQL database
  - Sinatra-ActiveRecord

#### View
  - HTML
  - CSS
  - Bootstrap
  - JavaScript
  - jQuery
  - Ruby ERB

#### Controller
  - Ruby
  - Sinatra
  - PG
  - ActiveRecord
  - BCrypt
  - Open-URI

### User Management

  The application requires users to register and/or login with their account.  User passwords are stored in the database as a combination of a password_hash and a password_salt.

  Validation of a users email is done using BCrypt to take the password the user entered and use the password_salt to create a password_hash.  The generated password_hash is compared to the stored password_hash, and if they match the user is authenticated and redirected to the main page.

### Front-End/Views

  Users are presented with a a form to select at least 1 and up to 5 Dota2 heroes they are playing against.  Clicking the calculate button will generate a view showing a the hero, image of the hero, and the top 5 counter heroes and their images.


### Back-End/Controllers

  Ruby and Sinatra are used to configure the back-end.  Bundler is included to manage Gemfile dependencies.  Controllers are broken down into:

  - Application
  - Login
  - Register
  - Home
  - Hero
  - Upload

  All of the controllers inherit from the Application Controller.  This modular approach allows changes to one controller without effecting the overall application.

  The upload controller is used to scrape data using the Open-uri gem, parse it using the Nokorgiri gem, specifying the Xpath and  adding the data to an array.

  ```ruby
  heroes_doc = Nokogiri::HTML(open("http://dotabuff.com/heroes")) # this grabs the page.
  names_array = heroes_doc.xpath("//div[@class='name']/text()")
  ```

  Once the model is populated, we use this to return data to the views.  

## Installation Instructions

1. Clone this repository
2. Navigate to the directory it is stored in
3. 'bundle' the Gemfile
4. Run the migrations.sql file in Postgres to generate the required databases
5. Run 'bundle exec rackup'
6. Browse to localhost:9292

## Unsolved Problems

## Version 2.0

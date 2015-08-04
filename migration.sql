CREATE DATABASE herocounterpicker;
\c herocounterpicker
CREATE TABLE users (id SERIAL PRIMARY KEY, user_name varchar(255), user_email varchar(255), password_hash varchar(255), password_salt varchar(255));



CREATE TABLE herocounter (id SERIAL PRIMARY KEY,
  name varchar(255),
  imageUrl varchar(255),
  counter1 varchar(255), counterImageUrl1 varchar(255),
  counter2 varchar(255), counterImageUrl2 varchar(255),
  counter3 varchar(255), counterImageUrl3 varchar(255),
  counter4 varchar(255), counterImageUrl4 varchar(255),
  counter5 varchar(255), counterImageUrl5 varchar(255),
  counter6 varchar(255), counterImageUrl6 varchar(255),
  counter7 varchar(255), counterImageUrl7 varchar(255),
  counter8 varchar(255), counterImageUrl8 varchar(255));

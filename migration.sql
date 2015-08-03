CREATE DATABASE coupons

\c coupons
CREATE TABLE coupons (id SERIAL PRIMARY KEY, title varchar(255), description varchar(255), product varchar(255), discount real, expiration_date date);

INSERT INTO coupons (title, description, product, discount, expiration_date)
  VALUES ('coupon 1', 'A coupon', 'for coffee', .1, '2016,11,27');



-- creating a users TABLE
CREATE TABLE users (id SERIAL PRIMARY KEY, user_name varchar(255), user_email varchar(255), password_hash varchar(255), password_salt varchar(255));

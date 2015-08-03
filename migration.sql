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
INSERT INTO herocounter (
  name,
  imageUrl,
  counter1, counterImageUrl1,
  counter2, counterImageUrl2,
  counter3, counterImageUrl3,
  counter4, counterImageUrl4,
  counter5, counterImageUrl5,
  counter6, counterImageUrl6,
  counter7, counterImageUrl7,
  counter8, counterImageUrl8)
  VALUES
  ('Pudge',
    'http://www.dotabuff.com/assets/heroes/pudge-26ef8b6938086abf2edb2b4f9aebccf6f14bd20bae3962d1585e735929b2ba17.jpg',
   'Zeus', 'http://www.dotabuff.com/assets/heroes/zeus-afe705ff8e93ff4cc260b3bd8e012fb085c76e890c3d1118314c9c6f56b2b6b4.jpg',
   'Lehsrac', 'http://www.dotabuff.com/assets/heroes/leshrac-02e15b259ef7b868a763b7f25521b693b3a90f8e01576d748e9527a5d9c14f76.jpg',
   'Techies', 'http://www.dotabuff.com/assets/heroes/techies-b247337084bffd453d703364c6abcbf2e91c4d8638e20836706e75376985fbde.jpg',
   'Pugna', 'http://www.dotabuff.com/assets/heroes/pugna-5b40621edef4a4489ad4c0ae0f5c2b86b9e4172b7aafb23f0a54569b75b6baba.jpg',
   'Crystal Maiden', 'http://www.dotabuff.com/assets/heroes/crystal-maiden-d9d7e6cbea64990c492bd3adc66c3d6f738c9f229301f5284e43a318a1da9829.jpg',
   'OmniKnight', 'http://www.dotabuff.com/assets/heroes/omniknight-6e248fddcb25adbac76e128b31e905e0371e6f419a176b9966f1c1373a587e0e.jpg',
   'Luna', 'http://www.dotabuff.com/assets/heroes/luna-fc878724cecefe8fb0f7d70ed19a57e9e892449d8999b7ea48b026cb9e7ca85b.jpg',
   'Venomancer', 'http://www.dotabuff.com/assets/heroes/venomancer-28baf928e70c15c04c400896ebfc4ed45aa40b42b999ce931d610c789c9c0152.jpg');

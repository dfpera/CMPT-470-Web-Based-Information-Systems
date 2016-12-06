CREATE DATABASE IF NOT EXISTS noted_development;
CREATE DATABASE IF NOT EXISTS noted_test;
CREATE DATABASE IF NOT EXISTS noted_production;
<<<<<<< HEAD
CREATE USER IF NOT EXISTS 'noted_admin'@'localhost' IDENTIFIED BY 'cmpt470group14';
=======
CREATE USER 'noted_admin'@'localhost' IDENTIFIED BY 'cmpt470group14';
>>>>>>> 091c3ecb5ddf2b073544dcacdcc76a81ad35e865
GRANT ALL PRIVILEGES ON *.* TO 'noted_admin'@'localhost'

CREATE DATABASE IF NOT EXISTS noted_development;
CREATE DATABASE IF NOT EXISTS noted_test;
CREATE DATABASE IF NOT EXISTS noted_production;
CREATE USER IF NOT EXISTS 'noted_admin'@'localhost' IDENTIFIED BY 'cmpt470group14';
GRANT ALL PRIVILEGES ON *.* TO 'noted_admin'@'localhost'

-- +migrate Up
CREATE TABLE IF NOT EXISTS user (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  phone varchar(15) DEFAULT NULL,
  is_phone_confirmed tinyint(1) DEFAULT NULL,
  nama varchar(64) DEFAULT NULL
);
-- +migrate Down
DROP TABLE IF EXISTS user;
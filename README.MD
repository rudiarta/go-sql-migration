# How to install 
```sh
    $ go get -v github.com/rubenv/sql-migrate/...
```
repo link: [sql-migrate](https://github.com/rubenv/sql-migrate)
<br>
<br>
# How to use
if you want to create new migration:
```sh
    $ sql-migrate new create_table_name
```

if you want to run the migration:
```sh
    $ sql-migrate up
```

if you want to drop 1 migration before
```sh
    $ sql-migrate down
```

Example migration:

```sql    
-- +migrate Up
CREATE TABLE IF NOT EXISTS user (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  phone varchar(15) DEFAULT NULL,
  is_phone_confirmed tinyint(1) DEFAULT NULL,
  nama varchar(64) DEFAULT NULL
);
-- +migrate Down
DROP TABLE IF EXISTS user;
```
<br>
<br>

# How to config DB connection
if you want change the db connection you can change `dbconfig.yml` on the root path of this project:
```yml
production:   // this is for production environtment
    dialect: mysql
    datasource: dbuser:dbpassword@tcp(127.0.0.1:3306)/dbname?parseTime=true
    dir: migrations
development: // this is for deelopment environtment
    dialect: mysql
    datasource: dbuser:dbpassword@tcp(127.0.0.1:3306)/dbname?parseTime=true
    dir: migrations
```

if you want run different migration environtment you can use code below:
```sh
    $ sql-migrate up -env="development" //for development
    $ sql-migrate up -env="production" //for production
```
#! /bin/bash
db_name=''
db_pass=''
user_name=''

file="DB_init.sql"
echo "CREATE DATABASE $db_name;" > $file
echo "CREATE USER $user_name WITH PASSWORD '$db_pass';" >> $file
echo "ALTER ROLE $user_name SET client_encoding TO 'utf8';" >> $file
echo "ALTER ROLE $user_name SET default_transaction_isolation TO 'read committed';" >> $file
echo "ALTER ROLE $user_name SET timezone TO 'UTC';" >> $file
echo "GRANT ALL PRIVILEGES ON DATABASE $db_name TO $user_name;" >> $file
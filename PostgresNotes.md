
$ sudo yum install postgresql-server postgresql-contrib postgresql-devel
sudo systemctl enable postgresql
 systemctl enable postgresql

gem install pg
bundle

sudo -u postgres psql
create role climb with createdb login password 'black_diamond'

since 'climb' is not the system user name you need to go edit
/var/lib/pgsql/data/pg_hba.conf and change all auth methods to md5.

Otherwise, setup a postgres user with the same value as your system
account and adjust database.yml accordingly


#! /bin/bash

cp pg_hba.conf /etc/postgresql/13/main/pg_hba.conf
cp postgresql.conf /etc/postgresql/13/main/postgresql.conf

sudo -u postgres psql -f DB_init.sql

pip3 install --upgrade pip
pip3 install virtualenv

ufw enable
ufw allow 'Nginx Full'
ufw allow OpenSSH
ufw allow 5432

PROJ="django_demo"
PROJ_PATH="/var/www/$PROJ"
PROJ_VENV="$PROJ_PATH/venv"
virtualenv $PROJ_VENV
source $PROJ_VENV/bin/activate && pip3 install -r $PROJ_VENV/requirements.txt
deactivate

cp gunicorn.service /etc/systemd/system/gunicorn.service
cp gunicorn.socket /etc/systemd/system/gunicorn.socket

mkdir /var/log/gunicorn && chown www-data:www-data /var/log/gunicorn
mkdir /var/log/$PROJ && chown www-data:www-data /var/log/$PROJ

cp $PROJ /etc/nginx/sites-available/$PROJ
ln -s /etc/nginx/sites-available/$PROJ /etc/nginx/sites-enabled

systemctl start gunicorn.socket
systemctl enable gunicorn.socket

systemctl restart nginx
systemctl enable nginx

systemctl restart postgresql
systemctl enable postgresql


# python manage.py createsuperuser
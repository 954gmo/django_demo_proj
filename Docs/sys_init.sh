#! /bin/bash

sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" \
> /etc/apt/sources.list.d/pgdg.list' \
&& wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |  apt-key add -

apt-get update && apt-get -y install postgresql-13 python3-pip \
                python3-dev libpq-dev  postgresql-contrib-13 nginx curl

TOKEN=`cat ./token`

cd /var/www && git clone https://954mog:$TOKEN@github.com/954gmo/django_demo.git

cd django_demo/Docs && source env_setup.sh





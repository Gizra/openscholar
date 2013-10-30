#!/bin/bash

chmod 777 www/sites/default
rm -rf www/
mkdir www

bash scripts/build

cd www

drush si -y openscholar --account-pass=admin --db-url=mysql://root:root@localhost/openscholar --uri=http://localhost/openscholar/www openscholar_flavor_form.os_profile_flavor=development openscholar_install_type.os_profile_type=vsite
drush vset purl_base_domain 'http://localhost/openscholar/www'
drush en -y os_migrate_demo
drush mi --all --user=1


cd ~/Downloads
wget http://wiki.gizra-labs.com/images/e/ee/Apache-solr-3.6.2.zip
unzip -o Apache-solr-3.6.2.zip
cd apache-solr-3.6.2/example/solr/conf
yes | cp /var/www/openscholar/www/profiles/openscholar/modules/contrib/apachesolr/solr-conf/solr-3.x/* .
cd ../../
#gnome-terminal --window --title=solr -e "java -jar start.jar"
java -jar start.jar &

#sleep 10

cd /var/www/openscholar/www
drush en os_search_solr -y
sleep 5
drush solr-mark-all
drush solr-index


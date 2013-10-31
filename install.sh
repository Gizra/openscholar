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



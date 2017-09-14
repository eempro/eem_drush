composer create-project drupal-composer/drupal-project:8.x-dev /var/www/monkeytwo --stability dev --no-interaction
cd /var/www/monkeytwo
composer config repositories.drupal composer https://packages.drupal.org/8

# Uninstall modules
drush --root=/var/www/monkeytwo/web pmu dblog
drush --root=/var/www/monkeytwo/web pmu tour
drush --root=/var/www/monkeytwo/web pmu syslog
drush --root=/var/www/monkeytwo/web pmu search

# Install modules
php ~/composer.phar require "drupal/paragraphs ~1.1"
drush --root=/var/www/monkeytwo/web en paragraphs

php ~/composer.phar require "drupal/conditional_fields"
drush --root=/var/www/monkeytwo/web en conditional_fields

php ~/composer.phar require "drupal/bootstrap"
drush --root=/var/www/monkeytwo/web en bootstrap

php ~/composer.phar require "drupal/prepopulate ~2.0"
drush --root=/var/www/monkeytwo/web en prepopulate

# Roles
drush --root=/var/www/monkeytwo/web role-create 'Level-1'
drush --root=/var/www/monkeytwo/web role-add-perm 'Level-1' 'create new facility content'
drush --root=/var/www/monkeytwo/web role-add-perm 'Level-1' 'create facility content'
drush --root=/var/www/monkeytwo/web role-add-perm 'Level-1' 'create facility content'
drush --root=/var/www/monkeytwo/web role-add-perm 'Level-1' 'delete own facility content'
drush --root=/var/www/monkeytwo/web role-add-perm 'Level-1' 'edit own facility content'
drush --root=/var/www/monkeytwo/web role-add-perm 'Level-1' 'create meter content'
drush --root=/var/www/monkeytwo/web role-add-perm 'Level-1' 'delete own meter content'
drush --root=/var/www/monkeytwo/web role-add-perm 'Level-1' 'edit own meter content'
drush --root=/var/www/monkeytwo/web role-add-perm 'Level-1' 'create monthly_fuel_consumpution content'
drush --root=/var/www/monkeytwo/web role-add-perm 'Level-1' 'delete own monthly_fuel_consumpution content'
drush --root=/var/www/monkeytwo/web role-add-perm 'Level-1' 'edit own monthly_fuel_consumpution content'

drush --root=/var/www/monkeytwo/web role-remove-perm 'anonymous' 'access content'
drush --root=/var/www/monkeytwo/web role-remove-perm 'anonymous' 'use search'
drush --root=/var/www/monkeytwo/web role-remove-perm 'anonymous' 'search'
drush --root=/var/www/monkeytwo/web role-remove-perm 'anonymous' 'access comments'
drush --root=/var/www/monkeytwo/web role-remove-perm 'anonymous' 'access site-wide contact form'

drush --root=/var/www/monkeytwo/web role-create 'webmaster'


# Site config
drush --root=/var/www/monkeytwo config-set system.site name 'eEnergy Manager'
drush --root=/var/www/monkeytwo/web config-set system.theme default bootstrap
drush --root=/var/www/monkeytwo/web config-set system.site page.front '/start'

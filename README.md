# Pre-requisites

## Enable clean URLs in Drupal 8
1. Enable Apache Rewrite module: `a2senmod rewrite`
2. Allow Directory overrides. For this, in `apache2.conf, add:
```
<Directory /Directory/root>
    AllowOverride All
</Directory>
```

## Writable files
1. Make `/default/sites/files` folder writable

# Aptitude installs
`mysql-server mysql-client git python3 drush libapache2-mod-php php-xml php7.0-gd composer`

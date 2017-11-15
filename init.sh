#!/usr/bin/env bash

# Install WP (using wp-cli.yml file)
wp core download --force

# Create wp-config (using wp-cli.yml file)
wp config create --force


# Install site (using wp-cli.yml file)
wp core install

# install plugins (using plugins.txt file)
while read line
do
    wp plugin install $line --activate
done < ./plugins.txt


# Clean tedious elements
wp post delete 1 --force
wp post delete 2 --force
wp plugin delete hello

# Set permalinks to postname
wp rewrite structure "/%postname%/" --hard
wp rewrite flush --hard

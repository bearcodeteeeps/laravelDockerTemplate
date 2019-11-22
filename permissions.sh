#!/usr/bin/env bash

if [ "$SUDO_USER" = "" ]
 then
    echo "You need to run this script with sudo"
else
    echo "Changing owner"
    chown -R $SUDO_USER:www-data .

    echo "setting permissions to files"
    find . -type f -exec chmod 664 {} \;

    echo "setting permissions to dirs"
    find . -type d -exec chmod 775 {} \;

    echo "setting persisting permissions on dirs"
    find . -type d -exec chmod g+s {} \;

    echo "allowing artisan to exec"
    chmod u+x ./artisan

    echo "allowing pre-commit to exec"
    chmod u+x ./.git/hooks/pre-commit

    echo "allowing phpcs to exec"
    chmod u+x ./vendor/bin/phpcs

    echo "allowing phpunit to exec"
    chmod u+x ./vendor/bin/phpunit

    echo "allowing php-cs-fixer to exec"
    chmod u+x ./vendor/bin/php-cs-fixer

    echo "setting this file executable"
    chmod u+x ./permissions.sh

    echo "babel execution permissions"
    chmod -R u+x ./node_modules/babel-cli/bin
fi
#contruction variable
_DEPLOY_BRANCH="main"
#cd to root project
#cd /var/www/html/cicd/

#check php version
php -v

#starting maintenance mod in laravel
php artisan down

#clear changed project local
git checkout .

#reset local current branch
git reset --hard HEAD~2

#fetch code
git fetch --all

#pull new code from git
git pull origin $_DEPLOY_BRANCH

#install vendors/
composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev

#run migration laravel
#php artisan migrate --force

# Clear caches
php artisan cache:clear

# Clear expired password reset tokens
#php artisan auth:clear-resets

# Clear and cache routes
php artisan route:cache

# Clear and cache config
php artisan config:cache

# Clear and cache views
php artisan view:cache


#install node_modules
npm install

#build file
npm run prod

# End maintenance mode
php artisan up


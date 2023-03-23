#contruction variable
_DEPLOY_BRANCH="main"
#cd to root project
#cd /var/www/html/cicd/
#check php version
echo "check php version"
php -v

#starting maintenance mod in laravel
echo "stating maintenance mod..."
php artisan down

#clear changed project local
git checkout .

#reset local current branch
git reset --hard HEAD~2

#fetch code
echo "Fetch repository..."
git fetch --all

#pull new code from git
echo "Pull branch new code"
git pull origin $_DEPLOY_BRANCH

#install vendors/
echo "Install vendor/ folder"
composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev

#generate keygen
echo "Generate key"
php artisan key:generate

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
echo "Install node_modules/ folder"
npm install

#build file
npm run prod

# End maintenance mode
echo "End mantenance mode"
php artisan up


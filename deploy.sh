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
git pull origin $_DEPLOY_BRANCH --force

#install vendors/
echo "Install vendor/ folder"
composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev

#composer update remove composer.lock
composer update

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

#node version
nvm use 18.15.0

#install node_modules
echo "Install node_modules/ folder"
npm i --save-dev @types/node

#build file
npm run build

#run migration file
php artisan migrate

#build file
php artisan db:seed

# End maintenance mode
echo "End mantenance mode"
php artisan up


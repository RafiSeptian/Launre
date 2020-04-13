## How to install Launre App

- Run composer install
- Rename .env.example to .env and configurate it with your own fresh database
- Run php artisan key:generate
- Run php artisan voyager:install
- Extract package.zip and copy tcg folder to vendor folder (if tcg folder already exists, you can replace it)
- Run php artisan db:seed --class=UsersSeeder
- Run php artisan serve to start Launre App
- Look for all user in users.txt file and login to Launre by using that user	
- Enjoy


### List of package used

- Voyager Laravel Admin Template
- Jenssegers Date
- Maatwebsite Laravel Excel
- DomPdf
- Nexmo SMS API
- Yajra Laravel DataTable

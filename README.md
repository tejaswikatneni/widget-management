# README

Code has been deployed to heroku please check the following link https://guarded-bayou-40616.herokuapp.com/

To setup the application on local machine

bundle install

Include postgres database

Run rake db:create and rake db:migrate

rails s

Test user credentials on https://guarded-bayou-40616.herokuapp.com/
Email: test@mailinator.com
Password: qazplm123

Set environment variables

run figaro install, it generates application.yml file

client_id: client_id, 
client_secret: client_secret,
app_url: https://showoff-rails-react-production.herokuapp.com/api/v1,
host_url: https://showoff-rails-react-production.herokuapp.com, 
token_type: Bearer


# Description
Fast chat application with live users tracking to communicate with friends. No need to register, just open app, create room and invite friends!

## Setup
1. Required **Ruby** (*v. 3.1.2*) & **Rails** (*v. 7*) installed on your PC.
2. Clone application to local PC:
```
git clone git@github.com:Godlikefreq/instachat.git
```
4. Run
```
bundle install
```

### Database setup
1. To specify database name, adapter and other parameters for different scopes change it in `config/database.yml`. 
Default DB adapter is **PostgreSQL** ([**Install PostgreSQL on Ubuntu 20.04**](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart#step-1-installing-postgresql)).
2. Make new database ([**Create DB in PostgreSQL**](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart#step-4-creating-a-new-database)).
3. Run
```
bundle exec rails db:migrate
```

### Redis setup
Install and configure Redis ([**Instruction for Ubuntu 20.04**](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-20-04))

### Capistrano setup
1. Configure `config/deploy.rb`:
```ruby
set :application, "appname"
set :repo_url, "git@github.com:User/myapp.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/username/appname"
set :branch, "main"
```
2. Configure `config/deploy/production.rb`:
```ruby
server "myapp.example.com", user: "username", roles: %w{app db web}
```

## Run locally
1. To run application on your local machine run following command in console:
```
rails s
```
2. Open `http://localhost:3000/` in your browser.

## Deployment
Deploy new versions of application with:
```
cap production deploy
```

## Live demo of working app
[**Application here**](http://chat.mylessondomain.ru/)

## Sources
- Powered with [**Bootstrap 5**](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
- Made and tested on **Ruby 3.1.2** & **Rails 7**

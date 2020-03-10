# README

## What did I use
The programming language used to build this app is **Ruby on rails**
With help of some Gems like bootstrap, postgres and letter_opener_web to view the Emails.
## How to run the app
you can run the app either using docker or your local env.
afterwards you can access it by going to [http://localhost:3000](http://localhost:3000)
to view all the sent emails go to [http://localhost:3000/letter_opener/](http://localhost:3000/letter_opener/)

## Run using Docker
type in the terminal `docker-comose build`
then `docker-comose up`
for the first time you need to prepare the database as well.
to do that run the following in another terminal:
* `docker exec -it  /bin/sh`
* `bundle exec rails db:create`
* `bundle exec rails db:migrate`  
finally `exit`

## Run without docker
you need to have ruby installed, you can check how to install it from [here](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm)
you need also to have postgres in your machine: current config for the db has **postgres** as user name and
**password** as password, for more information, you can check this [tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-centos-7)
then go the mailerapp folder and install the ruby gems by running `bundle install` and `yarn install` to install js dependencies
now you are ready to create the database and migrate it by runnig
`bundle exec rails db:create` and then `bundle exec rails db:migrate`
**finally:** `rails s` to start the server

## How does it work
When the user submit the form, a new record will be created and saved in the database with state **In progress**.
The user will be redirected to the index page which has all the emails.
An asynchronous operation will be executed simultaneously
a loop will go over the receivers and invoke an action to send each one the message and wait 0.5 sec between each request.
When the job is done the state will be changed to **Email has been sent**
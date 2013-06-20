# Welcome to my user management app

## prerequisite
``` shell
$ bundle install
$ rake db:schema:load

# create the faker testing users
$ bundle exec rake db:reset
$ bundle exec rake db:populate
$ bundle exec rake db:test:prepare
```
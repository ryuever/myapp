# ruby app to upload and download files

## prerequisite
``` shell
$ bundle install
$ rake db:schema:load

# create the faker testing users
$ rake db:reset
$ rake db:populate
$ rake db:test:prepare
```

## feature 
1. User management 
2. Every user will has a page to display the books he had uploaded.
3. Every book will has a download time attribute to indicate the popularity.
4. In all attachments view, the left will display all the users and the right will display his corresponding upload books.
5. Search books according to the category through the search view.

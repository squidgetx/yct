[Live Link](https://yct.herokuapp.com)

Ruby 2.1.1
Rails 4.1.0
PostgreSQL
ImageMagick

YCT is an app for the Yale Climbing Team website. Name subject to change.

While currently it is an app aimed specifically for the Yale Climbing team I would like to keep it abstracted for use theoretically by any kind of undergraduate organization.

## Setup

Install rbenv, ruby, postgres-devel packages, imagemagick, and then run bundle. Set up a user postgres 'climb' with password 'black_diamond' for dev work. See postgresnotes.md for more details.

`rake db:create` to create the db's
`rake db:schema:load' to load the schema
`rake app:setup` to create the first admin user
`rake db:seed` to seed the db with some dummy data

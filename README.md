# Social API (Basic Facebook)

made by [@sulmanweb](https://twitter.com/sulmanweb)

## Technology
- Ruby 2.6.5
- Rails API Only 6.0.1
- Postgresql
- GraphQL

## ToDos

- [x] Open access to API global for any front end
- [x] Init GraphQL with UI
- [ ] Add Unit Testing Suite RSpec
- [ ] Add Users and authentication using JWT
- [ ] Add Posts for Users
- [ ] Friendship Modelling for users
- [ ] Attach images to the post, user avatar and cover photos
- [ ] Like, comment modelling for posts

## To Clone and user

- must have rbenv ruby version 2.6.5.
- run `bundle install`.
- Remove `config/creadentials.yml.enc`.
- run `EDITOR=subl rails credentials:edit` or any other editor of your using to create your credential file according to your system.
- Fill the credentials encrypted according to `config/credentials.example.yml` (**Note**: You can generate secret key using `rails secret`)
- run `rails db:create` after tweaking `config/database.yml` according to your system.
- run `rails db:migrate` to migrate the latest schema.
- run `rails db:seed` to seed initial data.
- run `rails s` to run server
- go to [http://localhost:3000/graphiql](http://localhost:3000/graphiql) for graphql ui with documentation

## To Contribute

- Fork the repo and create new branch of the feature or issue and create Pull Request of branch to merge in master.
# Sample Blog
  * [Project Board](https://github.com/oscarcuihang/sample_blog/projects/1)
  * [Technical Design](docs/TECHDESIGN.md)

## Development
### [Install Ruby and Rails](https://gorails.com/setup/osx/10.14-mojave)
You can stop after install sqlite3, this project is using sqlite, but you can easily migrate to any database by installing the database and change [database config](/config/database.yml)

* Ruby Verions: `2.5.3`
* Rails Version: `5.2.2`

### Install dependencies
```
$ git clone https://github.com/oscarcuihang/sample_blog
$ cd sample_blog

$ bundle install
(this will install all rails project dependencies)

### Database initialization
Database Setup
```
$ rake db:create db:migrate db:seed
```

Reset Database
```
$ rake db:drop db:create db:migrate db:seed
```

### Start servers
Start rails server (Backend)
* open a new console
* `$ rails s -p 3000` 

Visit in broswer
* http://localhost:3000 

### File Structure
```
.
|-- app
|   |-- assets
|   |-- controllers
|   |-- channels
|   |-- helpers
|   |-- services
|   |-- views
|-- config
|-- db
|-- Gemfile
|-- Gemfile.lock
|-- package.json
|-- lib
|-- log
```

##### app/controllers/
This director contains all ActionController logic
##### app/model/
This director contains all ActiveModel
##### app/views/
This director contains all basic layout structures
##### app/services/
This director contains all additional business logic
##### db
This director contains all migration files, and `schema.rb`, and `seeds.rb`
##### config
This director contains all rails, database configurations
##### Gemfile
This file contains all Rails dependencies

## Datamodel
### User
* User has a name and an email, a user also has multiple blogs

### Blog
* Blog belongs to a single user
* Blog has published indicator
* Unauthorized user does not have access to blog

### Screenshots

## How to run the test suite
Test to be added in the future
* Unit Test for methods
* Linter for both rails and haml

## Contributing 
Bug reports and pull requests are welcome on [GitHub](https://github.com/oscarcuihang/sample_blog/projects/1). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
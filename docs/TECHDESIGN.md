# Sample Blog
### Technical Design
This is a blog Rails App. User is ble to create account and post blogs.

Tech Stack

| Tables | Rails Version|
| ------------- |:-------------:|
| Server | Rails |
| Websocket | ActionCable |
| Database | ActiveRecord(Any DB) |


#### Backend ([Ruby on Rails](https://rubyonrails.org/))

Rails is a powerful framework for fullstack project. By initialize a new project, generate new MVCs, the project is good to run at any time.

Difficulties and Solutions:

1. User System with [Devise](https://github.com/plataformatec/devise)
  * User system has a `.erb` version UI, need to be changed to haml or other front end UI
  * Doesn't implement user count retrieval by email

#### UI Frameworks
##### [rails-bootstrap](https://github.com/twbs/bootstrap-sass)
This this only used on the rails side. The project needs this b/c of the navbar and user system(devise), devise has pre-build front-end in bootstrap. I'll keep as it is until there is a better UI framework,

#### Future Improvements:
1. Reconstruct folder and files directory
2. Add docker to start project with rails
3. Eliminate un-nessary libraries

#### Datamodel
##### User
User Table is ceated by devise, but the core columns are

| Column        | Type           |
| ------------- |:-------------:|
|id|int|
|email|string|
|encrypted_password|string|
|name|string|

##### Blog
| Column        | Type           |
| ------------- |:-------------:|
|id|int|
|title|string|
|content|text|
|published|boolean|
|view_count|int|
|published_date|date|

#### Workflow & Sceenshots
##### Index Page W/O Sign in
![Index Page W/O Sign In](https://github.com/oscarcuihang/sample_blog/raw/master/docs/indexnologin.png "Index Page W/O Sign In")
  * Any user can view published blogs a table view without sign in or sign up
  * And user can use search without sign in or sign up

##### Sign UP
![Sign UP](https://github.com/oscarcuihang/sample_blog/raw/master/docs/signup.png "Sign Up")
  * User will need a name, an email, and a password in order to signup

##### Sign In
![Sign In](https://github.com/oscarcuihang/sample_blog/raw/master/docs/login.png "Sign In")
  * User will need to provide login info, or user can sign up

##### Index Page
![Index Page](https://github.com/oscarcuihang/sample_blog/raw/master/docs/indexlogin.png "Index Page")
  * Logged in user is able to view all published blogs in a table view
  * Logged in user will see a `New Blog` button

##### Blog Page
![Blog Page](https://github.com/oscarcuihang/sample_blog/raw/master/docs/show.png "Blog Page")
 * Any user is able to view a published blog
 * Show Blog Page will contain blog's title, published by and date, and bolg's content
 * Logged in user will have a edit button

##### New Blog Page
![New Page](https://github.com/oscarcuihang/sample_blog/raw/master/docs/new.png "New Page")
  * User is able to create a new blog from this page
  * User will need to provide a title, is published, or content for blog
  * Unpublished blogs will not be shown on index page
  * User's unpublished blogs can be view in user's blogs page(my blog page)
  * Blog is checked published but does not have a input published date will be set defaule date: `Date.today`

##### Edit Blog Page
![Edit Page](https://github.com/oscarcuihang/sample_blog/raw/master/docs/edit.png "Edit Page")
  * User can only edit user's own blogs
  * User is able to edit an existing blog from this page
  * Unpublished blogs will not be shown on index page
  * User's unpublished blogs can be view in user's blogs page(my blog page)
  * Blog is checked published but does not have a input published date will be set default date: `Date.today`
  * Blog previously published but published later the date will be set default `nil`

##### Search Blog Page
![Search Page](https://github.com/oscarcuihang/sample_blog/raw/master/docs/search.png "Search Page")
  * User is able to search any blog's title with input
  * Search results will be shown as index table view

##### My Blog Page
![My Page](https://github.com/oscarcuihang/sample_blog/raw/master/docs/myblog.png "My Page")
  * This page will only display logged in user's blog (including both published or not published)
  * User's blogs will be shown as index table view with 2 extra actions, `Edit` and `Delete`









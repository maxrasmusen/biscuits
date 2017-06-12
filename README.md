# Biscuits Discussion
## Installation 
Clone the repo with ```git clone git@github.com:maxrasmusen/biscuits.git```

### Run Locally
To run locally:

Ensure bundler is installed and up to date: ``` gem install bundler```

Navigate to root directory. 

Run ``` bundle ```

In order to run the database setup, you may need to give the current user execute permission for the script db_setup.sh. Do this by running ```chmod 755 db_setup.sh```. 

Run the database setup script: ``` ./db_setup.sh ```

Finally run ``` rackup ```

### Deploy to heroku

[Sign up to heroku and install heroku command line interface] (https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction) 

Run the following commands: 

``` heroku create ```

``` git push heroku master ```

```heroku rake db:migrate ```

```heroku rake db:seed ```

```heroku open ```

## Usage
Users can navigate around the site. In the navbar, New biscuit allows users to create a new biscuit. Top biscuits displays a list of the highest rated biscuits. Popular biscuits displays a list of the most rated biscuits. Clicking on a biscuit navigates the user to that biscuit page. 

The message box displays all messages from all users on the index page, and displays all messages relating to a particular biscuit on that biscuit's page. Users can send new messages by typing in the box and pressing enter. There is no submit button. 

## Technologies
The back-end is written in ruby, and uses [sinatra] (https://rubygems.org/gems/sinatra). The database is managed using the	 [Activerecord ORM] (https://rubygems.org/gems/activerecord/versions/5.0.0.1).  Additional gems used are [ransack](https://rubygems.org/gems/ransack) for search and [imgurapi](https://rubygems.org/gems/imgurapi) to provide a ruby interface to the imgur api. This allows uploading images to imgur, so that images are preserved between version changes when the app is deployed to heroku. The database used is [postgres](https://rubygems.org/gems/pg).

The front-end uses html, css and JavaScript. The styling is partially done using [bootstrap] (http://getbootstrap.com/).
# A RESTful API accepting XML records that are parsed and stored in a DB, with rudimentary authentication

## Specification

We need to accept property details into a system via an API, and store

## Technology notes

The solution is built on Rails 5.1, with an SQLite database and RSpec for testing. I also considered Ruby Grape and AWS Lambda, but decided Rails offered greater extensibility and better default security options than Grape, and a less restrictive hosting requirement and greater familiarity than Lambda.

To enable Rails to work with XML input data, actionpack-xml_parser was added back in. Re-adding a former core functionality seemed more appropriate than building on Nokogiri.

## Installation and running

The software was written on Windows Subsystem for Linux running Ubuntu 16.04, but should work without issue on Linux and MacOS systems. Running directly on Windows has not been tested.

To set up the application, first clone it to the target environment using `git clone`. Then install Ruby and Bundler if necessary, and use `bundle install` to install the rest of the required software. Use `rake db:create` to set up the SQLite database, then `rake db:migrate` to initialise the tables. Running `rspec` should run the tests and confirm that the application is working. `rails s` runs a Rails server for ongoing access.

To usefully run this, you'll need to set it up on a live hosting platform, with a number of environment settings in place including the API authentication information.

## Development notes

Some notes have been split out to a [separate file concerning the software development](Answers to technical questions.md). The development tasks are as follows:

- [ ] Create Rails app in API mode, add RSpec for testing, and set up the default SQLite database
- [ ] Scaffold the Property class and related functionality
- [ ] Write initial integration and unit tests for Property to drive development
- [ ] Add XML handling and POST route

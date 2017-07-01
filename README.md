# A RESTful API accepting XML records that are parsed and stored in a DB, with rudimentary authentication

## Specification

We need to accept XML property details into a system via an API, and store them as records with the contents deserialised.

An example XML payload was provided. I've modified this slightly to preserve anonymity.

## Technology notes

The solution is built on Rails 5.1, with an SQLite database and RSpec for testing. I considered Ruby Grape and AWS Lambda, but decided Rails offered greater extensibility than Grape, and a less restrictive hosting requirement and greater familiarity than Lambda.

To enable Rails to work with XML input data, actionpack-xml_parser was required as a gem. Re-adding a former core functionality seemed more appropriate than building on Nokogiri. However, it became clear that XML is not well supported in core Rails, and this caused issues at every stage of development. An unresolved issue is that Hash#from_xml [loses XML attributes on tags that have no children](https://github.com/rails/rails/issues/588). A fix for this requires moving to either SimpleXML or Nokogiri.

API versioning is via URL at present, i.e. `/api/v1/[resource]`, rather than header.

The XML format for a POST implies creation of multiple objects in a single request. I reworked an initial solution that allowed posting of individual `property` objects, into one that requires `properties` as the top node in all cases. This means that the POST verb is attached to a non-idiomatic noun.

Standard Ruby naming syntax is to use snake_case. The XML fields are all in camelCase. [Building on this example](https://stackoverflow.com/questions/17240106/what-is-the-best-way-to-convert-all-controller-params-from-camelcase-to-snake-ca), I added [an initializer that transformed params from camelCase to snake_case](config/initializers/xml_param_key_transform.rb). This works for POST but not for e.g. GET, so would need to be taken into account if future development introduced further actions to the vocabulary.

For authentication, the spec requested simple authentication via e.g. an API key. This is yet to be implemented.

## Installation and running

The software was written on Windows Subsystem for Linux running Ubuntu 16.04, but should work without issue on Linux and MacOS systems. Running directly on Windows has not been tested.

To set up the application, first clone it to the target environment using `git clone`. Then install Ruby and Bundler if necessary, and use `bundle install` to install the rest of the required software. Use `rake db:create` to set up the SQLite database, then `rake db:migrate` to initialise the tables. Running `rspec` should run the tests and confirm that the application is working. `rails s` runs a Rails server for ongoing access.

To usefully run this, you'll need to set it up on a live hosting platform, with a database set up and migrated to the current structure, environment variables including the API authentication information, and user logins.

The route to access the API is:

* POST properties to /api/v1/properties with XML top level <properties> and a <property> tag for each property record

Either all of the submitted properties in a request will be successfully saved, or none of them will. This allows a single status code to be returned, but could potentially be improved on by identifying which records are invalid.

## Development notes

Some notes have been split out to a [separate file concerning the software development](Answers to technical questions.md). The development tasks are as follows:

- [x] Create Rails app in API mode, add RSpec for testing, and set up the default SQLite database
- [x] Scaffold the Property class and related functionality
- [x] Write initial integration and unit tests for Property to drive development
- [x] Add XML handling and POST route
- [x] Convert incoming camelCase field names to snake_case
- [x] Resolve incorrect routing on a response
- [x] Fix non-working snake_case conversion
- [x] Write tests for posting of multiple properties in a single request
- [x] Add controller code to post multiple properties in a single request
- [x] Set force SSL config in production usage
- [x] Remove ability to accept property as top node in a post request
- [x] Reject requests without properties -> property XML structure
- [x] Add remaining fields to the Property model, including arrays
- [ ] Scaffold the User class and related functionality
- [ ] Write tests for User to drive development
- [ ] Decide and set required / permitted fields
- [ ] Test that the saved data matches to the input data
- [ ] Remove unused verbs and tests
- [ ] Check CORS setup for production
- [ ] Refactor multiple property posting to model to separate concerns
- [ ] Use SimpleXML gem and monkey-patch Hash to enable attribute preservation

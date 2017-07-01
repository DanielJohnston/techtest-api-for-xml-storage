# Answers to technical questions

## How long did you spend on the coding test?

2 days

## What would you add to your solution if you had more time?

* Authentication and a User model. This isn't technically all that difficult, but I didn't get round to it in the time taken
* API Docs
* More content validation, and testing of failure modes and edge cases
* Continuous integration and deployment (Travis, Snyk, Code Climate, Heroku)
* Filling out the verbs (GET / PUT / PATCH / DELETE), with consideration of idempotency to prevent duplication and the ability to unpublish listings as well as publish them
* Tiddle for multiple token authentication, and restrict access to owners at the model level
* Admin-level user rights to manage users and work with database content
* Request logging to track activity
* Explore choice of unique key - assumption was that the 'unique' key in the given data could still be duplicated across multiple organisations uploading to the application, so wasn't
* Explore bulk posting errors - currently, it's all-or-nothing, with no indicator of which records trigger an error
* Consider a completely different solution to the underlying requirement

## If you didn't spend much time on the coding test then use this as an opportunity to explain what you would add.

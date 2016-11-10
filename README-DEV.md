## README for Development

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  * When creating your branch, branch off from `development`
  * When creating pull request, the base should be `development`
  * When creating pull request, reference your ticket number (e.g. "This closes #5") so the issue will be closed automatically (see [here](https://help.github.com/articles/closing-issues-via-commit-messages/) for more details)

* Pull request instructions
  * Before pushing your branch to origin, please merge `development` into your own branch and resolve any merge conflicts
  * Rerun `bin/rake db:migrate RAILS_ENV=development` to make sure everything works
  * Run the server and go to the homepage to make sure there is no critical errors

* Resolving AWS rollback issue
  * SSH into AWS EC2 instance with the .pem file
  * Error logs can be found at `/var/log/cloud-init-output.log`
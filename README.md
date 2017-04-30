# Chat application [![Code Climate](https://codeclimate.com/github/codeclimate/codeclimate/badges/gpa.svg)](https://codeclimate.com/github/brunossilveira/chat)

This is my chat application, that translates the messages using user selected dialect.
It uses a custom api class to call (Crapola Web Translator)[http://www.degraeve.com/translator.php] and translate sent message, ActionCable to handle pub/sub funcionality
RSpec for testing, Bootstrap for aesthetics and more.

Dialect options:
* Yoda
* Valley Girl
* Binary

### Added features

It has user authentication using Devise and the ability to create rooms

## Instalation

*You need to have redis installed in order for ActionCable to work.*

`git clone https://github.com/brunossilveira/chat.git`

`create a .env file`

`bundle install`

`rake db:create`

`rake db:migrate`

`rails server`

## Tests

To run the tests just

`rspec`

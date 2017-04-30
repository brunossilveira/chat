# Chat application

This is my chat application, that translates the messages using user selected dialect.

Dialect options:
* Yoda
* Valley Girl
* Binary

It uses a custom api class to call (Crapola Web Translator)[http://www.degraeve.com/translator.php] and translate sent message, ActionCable to handle pub/sub funcionality
RSpec for testing, Bootstrap for aesthetics and more.

## Instalation

*You need to have redis installed in order for ActionCable to work.*

```
git clone https://github.com/brunossilveira/chat.git
```
```
create a .env file
```
```
bundle install
```
```
rake db:create
```
```
rake db:migrate
```
```
rails server
```

## Tests

To run the tests just

```
rspec
```

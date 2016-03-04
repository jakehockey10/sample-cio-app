##Sample Rails App with Context.IO

This is a sample Rails application that uses the Context.IO API to connect to an email account and fetch back data.

[Read more about Context.IO](https://context.io/docs/2.0)
[Read the Ruby Context.IO gem documentation](http://www.rubydoc.info/gems/contextio/frames)
[Context.IO Ruby gem on Github](https://github.com/contextio/contextio-ruby)

###Get up and running

1. Fork this repo and git clone it your machine
2. Run bundle install (gem install bundler if you do not have bundler)
3. Run `rake db:create`
4. Run `rake db:migrate`
5. Run `bundle exec figaro install`. An `application.yml` file will be created (and added to your gitignore files automagically).
6. Ensure you have a Context.IO key and secret (if you do not, go here to [sign up for a developer account](https://context.io/#signup).) If you do not know where to find your Context.IO key and secret, [click here](https://console.context.io/#settings) (login required).
7. Open the `application.yml` file located under the `config` folder and add your ContextIO key and secret there. If you want to keep naming convention to the Figaro ENV variables already in this app, use `contextio_key` and `contextio_secret` as your names.
8. Fire up your Rails server `rails s`
9. Go to `localhost:3000` and voila, your app is there. Go ahead and sign up a sample user.


###Dependencies

* We're using Devise to handle user registrations and sessions. You may use something different in your app. We're using Devise because it is pretty easy to get up and running, most people are familiar with this gem, and it is very well documented. Your signup flow may be different.
* This app uses [Figaro](https://github.com/laserlemon/figaro) to store your API keys securely. Please ensure you `bundle exec figaro install` to generate an `application.yml` file, where you can store your Context.IO key and secret.
* We're using the `gist-embed-rails` gem to display gists with sample code. Feel free to get rid of those if you don't need them anymore. We're also using `jquery-turbolinks` to get handle Turbolinks weirdness with the gists. Get rid of it if you no longer want the gists!

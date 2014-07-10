# pipedrive-ruby

[![Gem Version](https://badge.fury.io/rb/pipedrive-ruby.png)](http://badge.fury.io/rb/pipedrive-ruby)
[![Code Climate](https://codeclimate.com/github/GeneralScripting/pipedrive-ruby.png)](https://codeclimate.com/github/GeneralScripting/pipedrive-ruby)
[![Build Status](https://travis-ci.org/GeneralScripting/pipedrive-ruby.png?branch=master)](https://travis-ci.org/GeneralScripting/pipedrive-ruby)
[![Coverage Status](https://coveralls.io/repos/GeneralScripting/pipedrive-ruby/badge.png?branch=master)](https://coveralls.io/r/GeneralScripting/pipedrive-ruby?branch=master)

## Installation

    gem install pipedrive-ruby

## Usage

    require 'pipedrive-ruby'
    Pipedrive.authenticate( YOUR_API_TOKEN )
    Pipedrive::Deal.find( DEAL_ID )

## API Calls
    Pipedrive::Deal.create( params )
    Pipedrive::Deal.find( <ID> )
    Pipedrive::Deal.destroy( <ID> )

    Pipedrive::Organization.create( params )
    Pipedrive::Organization.find( <ID> )
    Pipedrive::Organization.destroy( <ID> )

    Pipedrive::Person.create( params )
    Pipedrive::Person.find( <ID >)
    Pipedrive::Person.destroy( <ID >)

    Pipedrive::Note.create( params )
    Pipedrive::Note.destroy( <ID >)

You can check some of the calls at https://developers.pipedrive.com/v1


## Contributing to pipedrive-ruby
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License

This gem is released under the [MIT License](http://www.opensource.org/licenses/MIT).

# Simple 

_Simple web development framework for Ruby._

## Features

* Built on top of [Rack](https://github.com/rack/rack) and [http_router](https://github.com/joshbuddy/http_router)
* Insanely small ruby web framework - < 100 LC
* Blazingly fast [benchmark](https://github.com/bry4n/simple/blob/master/examples/benchmark.log)
* Inspired by [Sinatra](https://github.com/sinatra/sinatra)
* Works with Thin, Unicorn, Mongrel, Pow, Heroku
* Easy to write your own Ruby web application.

## Basic Usage

The little snippet of the famous hello world web application.

```ruby
# config.ru

require 'simple'
  	
class Example < Simple::Base

  # GET /
  get "/" do
    [200, {"Content-Type" => "text/plain"}, ["Hello World"]]
  end

  # GET /hello
  get "/:message" do
    # params[:message]
  end

  # POST /users
  post "/users" do
    # User.create or etc
  end

  # GET /api/v1/users/online.xml
  namespace :api do
    namespace :v1 do
      get "/users/online" do
        # json/xml output
      end
    end
  end

end
  
run Example
````

This would create a Rack application.

## TODO

* Before/After Filters
* Helpers (Form/Link/etc)
* Render Templates
* And much more.

## Contribution

* Fork the project
* Make your feature addition or bug fix.
* Add test for it
* Send me a pull request. Topic branches preferred.

## Copyright

Copyright © 2012 Bryan Goines. See LICENSE for details.

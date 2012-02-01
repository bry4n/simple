# Simple 

_Simple web development framework for Ruby._

## Features

* Built on top of [Rack](https://github.com/rack/rack) and [http_router](https://github.com/joshbuddy/http_router)
* Insanely small ruby web framework - < 100 LC
* Blazingly fast benchmark
* Inspired by [Sinatra](https://github.com/sinatra/sinatra)
* Works with Thin, Unicorn, Mongrel, Pow, Heroku
* Easy to write your own Ruby web application.

## Basic Usage

The little snippet of the famous hello world web application.

```ruby
  # config.ru

  require 'simple'
  	
  class Example < Simple
    get "/" do
      [200, {"Content-Type" => "text/plain", ["Hello World"]]
    end
  end
  
  run Example.new
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
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright © 2012 Bryan Goines. See LICENSE for details.

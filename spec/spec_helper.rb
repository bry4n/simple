$: << "../lib"

ENV['RACK_ENV'] ||= "test"

require 'simple'
require 'rack/test'

class Example < Simple::Base

  namespace :admin do
    get "/show" do
      "admin"
    end
  end

  get '/hello' do
    "get"
  end

  post "/hello" do
    "post"
  end

  put "/hello" do
    "put"
  end

  delete "/hello" do
    "delete"
  end

end

def session
  last_request.env['rack.session']
end

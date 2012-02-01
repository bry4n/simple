$: << "../lib"

ENV['RACK_ENV'] ||= "test"

require 'simple'
require 'rack/test'

class Example < Simple::Base

  get "/google", :redirect => "http://google.com/"

  namespace :admin do
    get "/show" do
      respond :admin
    end
  end

  get '/hello' do
    respond :get
  end

  post "/hello" do
    respond :post
  end

  put "/hello" do
    respond :put
  end

  delete "/hello" do
    respond :delete
  end

  def self.respond(text)
    [200, {"Content-Type" => "text/plain"}, [text]]
  end

end

def session
  last_request.env['rack.session']
end

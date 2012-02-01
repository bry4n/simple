$:.unshift File.expand_path('../lib', __FILE__)

require 'simple'

class HelloWorld < Simple::Base

  namespace :api do
    namespace :v1 do
      get "/main" do
        "API!!"
      end
    end
  end

  resource :say do
    get "/:message" do
      "You said: #{params[:message]}!"
    end
  end

  get "/" do
    "Hello World!"
  end

  post "/test" do
    [200, {"content-type" => "text/plain"}, ["test..."]]
  end

end

run HelloWorld

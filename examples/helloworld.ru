$: << "lib"

require 'simple'

class HelloWorld < Simple::Base

  get "/google", :redirect => "http://www.google.com/"

  namespace :api do
    namespace :v1 do
      get "/main" do
        respond "API!"
      end
    end
  end

  resource :say do
    get "/:message" do
      message = params[:message]
      text = "Hello #{message}!"
      respond text
    end
  end

  get "/" do
    respond "Hello World!"
  end

  def self.respond(text, content_type = "text/plain")
    [200, {"Content-Type" => content_type}, [text]]
  end

end

run HelloWorld.new

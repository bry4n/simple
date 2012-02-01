require File.dirname(__FILE__) + "/spec_helper"

describe "ExampleApp" do
  include Rack::Test::Methods

  let(:app) { Example }
  
  it "GET /admin/show and then expect 200" do
    get "/admin/show"
    last_response.status.should == 200
    last_response.body.should == "admin"
  end
  
  it "GET /hello and then expect 200" do
    get "/hello"
    last_response.status.should == 200
    last_response.body.should == "get"
  end

  it "GET /blah/404 and then expect 403" do
    get "/blah/404"
    last_response.status.should == 404
    last_response.body.should == "Not Found"
  end

  it "POST /hello and then expect 200" do
    post "/hello"
    last_response.status.should == 200
    last_response.body.should == "post"
  end

  it "PUT /hello and then expect 200" do
    put "/hello"
    last_response.status.should == 200
    last_response.body.should == "put"
  end

  it "DELETE /hello and then expect 200" do
    delete "/hello"
    last_response.status.should == 200
    last_response.body.should == "delete"
  end

end

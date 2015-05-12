require 'helper'

class TestPipedriveAuthentication < Test::Unit::TestCase
  should "set authentication credentials on Pipedrive::Base" do
    Pipedrive.authenticate("some-token")
    assert_equal "some-token", Pipedrive::Base.default_options[:default_params][:api_token]
  end

  should "send authentication token with each request" do
    Pipedrive.authenticate("some-token")

    stub_request(:get, "https://api.pipedrive.com/v1/?api_token=some-token").
      with(:headers => {
        'Accept'=>'application/json',
        'Content-Type'=>'application/x-www-form-urlencoded',
        'User-Agent'=>'Ruby.Pipedrive.Api'
      }).
      to_return(:status => 200, :body => "", :headers => {})
    Pipedrive::Base.get("/")
  end
end

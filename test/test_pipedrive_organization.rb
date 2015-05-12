require 'helper'

class TestPipedriveOrganization < Test::Unit::TestCase
  def setup
    Pipedrive.authenticate("some-token")
  end

  should "execute a valid person request" do
    stub_request(:post, "https://api.pipedrive.com/v1/organizations?api_token=some-token").
      with(:body => {
          "name" => "Dope.org"
        },
        :headers => {
          'Accept'=>'application/json',
          'Content-Type'=>'application/x-www-form-urlencoded',
          'User-Agent'=>'Ruby.Pipedrive.Api'
        }).
      to_return(
        :status => 200,
        :body => File.read(File.join(File.dirname(__FILE__), "data", "create_organization_body.json")),
        :headers => {
          "server" => "nginx/1.2.4",
          "date" => "Fri, 01 Mar 2013 13:46:06 GMT",
          "content-type" => "application/json",
          "content-length" => "3337",
          "connection" => "keep-alive",
          "access-control-allow-origin" => "*"
        }
      )

    organization = ::Pipedrive::Organization.create({
      name: "Dope.org"
    })

    assert_equal "Dope.org", organization.name
  end

  should "return bad_response on errors" do
    # TODO
    # flunk "to be tested"
  end
end

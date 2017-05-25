require 'helper'

class TestPipedriveOrganization < Test::Unit::TestCase
  def setup
    Pipedrive.authenticate("some-token")
  end

  context "create organization" do
    setup do
      body = { "name" => "Dope.org" }
      
      stub :post, "organizations", "create_organization_body.json", body
      
      @organization = ::Pipedrive::Organization.create(body)
    end
    
    should "get a valid organization" do
      assert_equal "Dope.org", @organization.name
    end
  end

  should "return bad_response on errors" do
    # TODO
    # flunk "to be tested"
  end
end

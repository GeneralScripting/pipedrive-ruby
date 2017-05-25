require 'helper'

class TestPipedrivePerson < Test::Unit::TestCase
  def setup
    Pipedrive.authenticate("some-token")
  end
  
  context "create a person" do
    setup do
      body = {
        "email"=>["john@dope.org"],
        "name"=>"John Dope",
        "org_id"=>"404",
        "phone"=>["0123456789"]
      }
      
      stub :post, "persons", "create_person_body.json", body
      
      @person = ::Pipedrive::Person.create(body)
    end
    
    should "get a valid person" do
      assert_equal "John Dope", @person.name
      assert_equal 404, @person.org_id
      assert_equal "john@dope.org", @person.email.first.fetch("value")
      assert_equal "0123456789", @person.phone.first.fetch("value")
    end
  end

  should "return bad_response on errors" do
    #TODO
    # flunk "to be tested"
  end
end

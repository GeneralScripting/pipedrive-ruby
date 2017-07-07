require 'helper'

class TestPipedriveActivity < Test::Unit::TestCase
  def setup
    Pipedrive.authenticate("some-token")
  end
  
  context "create an activity" do
    setup do
      body = {
        "subject"   => "TEST",
        "type"      => "call",
        "person_id" => "2739",
        "due_date"  => "2017-10-04",
        "due_time"  => "11:00"
      }
      
      stub :post, "activities", "create_activity_body.json", body
      
      @activity = ::Pipedrive::Activity.create(body)
    end
    
    should "get a valid activity" do
      assert_equal "TEST", @activity.subject
      assert_equal "call", @activity.type
      assert_equal "2017/10/04 11:00", @activity.date.strftime("%Y/%m/%d %H:%M")
    end
    
    should "create related objects" do
      assert @activity.person.instance_of?(::Pipedrive::Person)
      assert @activity.user.instance_of?(::Pipedrive::User)
    end
  end
  
  context "find an activity" do
    setup do
      activity_id = 455
      organization_id = 2
      
      stub :get, "activities/#{activity_id}", "find_activity_body.json"
      stub :get, "organizations/#{organization_id}", "find_organization_body.json"
      
      @activity = Pipedrive::Activity.find(activity_id)
    end
    
    should "set attributes" do
      assert_equal "Follow up call", @activity.subject
      assert_equal "call", @activity.type
      assert_equal "2017/05/21 12:30", @activity.date.strftime("%Y/%m/%d %H:%M")
    end
  
    should "get associated organization" do
      organization = @activity.organization
      
      assert_equal "Office New York", organization.name
    end
    
    should "reload associated organization" do
      organization = @activity.organization true
      
      assert_equal "Office San Francisco", organization.name
    end
  end

  should "return bad_response on errors" do
    #TODO
    # flunk "to be tested"
  end
end
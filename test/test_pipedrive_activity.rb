require 'helper'

class TestPipedriveActivity < Test::Unit::TestCase
  def setup
    Pipedrive.authenticate("some-token")
  end

  should "execute a valid activity request" do
    body = {
      "subject"   => "TEST",
      "type"      => "call",
      "person_id" => "2739",
      "due_date"  => "2017-10-04",
      "due_time"  => "11:00"
    }
      
    stub_request(:post, "https://api.pipedrive.com/v1/activities?api_token=some-token").
      with(:body => body,
        :headers => {
          'Accept'=>'application/json',
          'Content-Type'=>'application/x-www-form-urlencoded',
          'User-Agent'=>'Ruby.Pipedrive.Api'
        }).
      to_return(
        :status => 200,
        :body => File.read(File.join(File.dirname(__FILE__), "data", "create_activity_body.json")),
        :headers => {
          "server" => "nginx/1.2.4",
          "date" => "Fri, 01 Mar 2013 14:01:03 GMT",
          "content-type" => "application/json",
          "content-length" => "1260",
          "connection" => "keep-alive",
          "access-control-allow-origin" => "*"
        }
      )

    activity = ::Pipedrive::Activity.create(body)

    assert_equal "TEST", activity.subject
    assert_equal "call", activity.type
    assert_equal "2017/10/04 11:00", activity.date.strftime("%Y/%m/%d %H:%M")
    assert activity.person.instance_of?(::Pipedrive::Person)
    assert activity.user.instance_of?(::Pipedrive::User)
  end

  should "return bad_response on errors" do
    #TODO
    # flunk "to be tested"
  end
end
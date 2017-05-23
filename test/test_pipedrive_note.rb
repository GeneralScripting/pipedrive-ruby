require 'helper'

class TestPipedriveNote < Test::Unit::TestCase
  def setup
    Pipedrive.authenticate("some-token")
  end

  should "execute a valid person request" do
    body = {
      "content"=>"whatever html body",
      "person_id"=>"1"
      # org_id
      # deal_id
    }

    stub_request(:post, "https://api.pipedrive.com/v1/notes?api_token=some-token").
      with(:body => body, :headers => {
          'Accept'=>'application/json',
          'Content-Type'=>'application/x-www-form-urlencoded',
          'User-Agent'=>'Ruby.Pipedrive.Api'
        }).
      to_return(
        :status => 200,
        :body => File.read(File.join(File.dirname(__FILE__), "data", "create_note_body.json")),
        :headers => {
          "server" => "nginx/1.2.4",
          "date" => "Fri, 01 Mar 2013 13:34:23 GMT",
          "content-type" => "application/json",
          "content-length" => "1164",
          "connection" => "keep-alive",
          "access-control-allow-origin" => "*"
        }
      )

    note = ::Pipedrive::Note.create(body)

    assert_equal "abc", note.content
    assert_equal 1, note.person_id
  end

  should "return bad_response on errors" do
    #TODO
    # flunk "to be tested"
  end
end

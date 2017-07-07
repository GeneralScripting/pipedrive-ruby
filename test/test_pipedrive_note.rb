require 'helper'

class TestPipedriveNote < Test::Unit::TestCase
  def setup
    Pipedrive.authenticate("some-token")
  end

  context "create note" do
    setup do
      body = {
        "content"=>"whatever html body",
        "person_id"=>"1"
        # org_id
        # deal_id
      }
      
      stub :post, "notes", "create_note_body.json", body
      
      @note = ::Pipedrive::Note.create(body)
    end
    
    should "get a valid note" do
      assert_equal "abc", @note.content
      assert_equal 1, @note.person_id
    end
  end

  should "return bad_response on errors" do
    #TODO
    # flunk "to be tested"
  end
end

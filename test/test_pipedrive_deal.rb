require 'helper'

class TestPipedriveDeal < Test::Unit::TestCase
  def setup
    Pipedrive.authenticate("some-token")
  end
  
  context "create a deal" do
    setup do
      body = {
        "currency" => "EUR",
        "org_id" => "72312",
        "title" => "Dope Deal",
        "value" => "37k"
      }
      
      stub :post, "deals", "create_deal_body.json", body
      
      @deal = ::Pipedrive::Deal.create(body)
    end
    
    should "get a valid deal" do
      assert_equal "Dope Deal", @deal.title
      assert_equal 37, @deal.value
      assert_equal "EUR", @deal.currency
      assert_equal 72312, @deal.org_id
    end
  end

  should "return bad_response on errors" do
    #TODO
    # flunk "to be tested"
  end
end
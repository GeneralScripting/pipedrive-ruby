require 'helper'

class TestPipedriveStage < Test::Unit::TestCase
	def setup
		Pipedrive.authenticate("some-token")
	end

	should "execute a valid stage request" do
		body = {}
		stub_request(:get, "http://api.pipedrive.com/v1/stages?api_token=some-token").
			with(:body => body,
				:headers => {
					'Accept'=>'application/json',
					'Content-Type'=>'application/x-www-form-urlencoded',
					'User-Agent'=>'Ruby.Pipedrive.Api'
				}).
			to_return(
				:status => 200,
				:body => File.read(File.join(File.dirname(__FILE__), "data", "create_stages_body.json")),
				:headers => {
					"server" => "nginx/1.2.4",
					"date" => "Fri, 01 Mar 2013 14:01:03 GMT",
					"content-type" => "application/json",
					"content-length" => "1260",
					"connection" => "keep-alive",
					"access-control-allow-origin" => "*"
				}
			)

		stages = ::Pipedrive::Stage.all
		first_stage = stages.first;

		assert_equal 5, stages.count

		assert_equal "Idea", first_stage.name
		assert_equal 1, first_stage.order_nr
		assert_equal 1, first_stage.pipeline_id
		assert_equal "Pipeline", first_stage.pipeline_name
	end
end

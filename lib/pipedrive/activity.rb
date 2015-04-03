module Pipedrive
  class Activity < Base

    def delete_activity activity_id
      res = delete "#{resource_path}/#{id}", { :body => { :id => activity_id } }
      res.success? ? nil : bad_response(res,activity_id)
    end

  end
end
module Pipedrive
  class Pipeline < Base
    def stages
      Stage.all(get "/stages", { :pipeline_id => self.id })
    end

    def self.statistics(id, start_date, end_date)
      res = get("#{resource_path}/#{id}/movement_statistics",
                :query => {:start_date => start_date, :end_date => end_date})
      res.ok? ? new(res) : bad_response(res,{:id=>id,:start_date=>start_date,:end_date=>end_date})
    end

    def self.deals(id, stage_id)
      Pipedrive::Deal.all(get "#{resource_path}/#{id}/deals", :stage_id => stage_id )
    end
    
    def self.conversion_statistics(id, start_date, end_date)
      res = get("#{resource_path}/#{id}/conversion_statistics",
                :query => {:start_date => start_date, :end_date => end_date})
      res.ok? ? new(res) : bad_response(res,{:id=>id,:start_date=>start_date,:end_date=>end_date})
    end
  end
end
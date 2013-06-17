module Pipedrive
  class Pipeline < Base
    def stages
      Stage.all(get "/stages", { pipeline_id: self.id })
    end
  end
end
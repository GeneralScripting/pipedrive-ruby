module Pipedrive
  class Stage < Base
    def self.deals(id)
      Deal.all(get "#{resource_path}/#{id}/deals", :everyone => 1)
    end
  end
end

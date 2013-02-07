module Pipedrive
  class Product < Base

    def deals
      Deal.all(get "#{resource_path}/#{id}/deals")
    end

  end
end
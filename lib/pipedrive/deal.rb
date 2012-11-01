module Pipedrive

  class Deal < Base

    def self.create( opts = {} )
      res = post "/deals", :body => opts
      if res.ok?
        Deal.new(res)
      else
        bad_response(res)
      end
    end

    def self.find(id)
      res = get "/deals/#{id}"
      if res.ok?
        Deal.new(res)
      else
        bad_response(res)
      end
    end

  end

end
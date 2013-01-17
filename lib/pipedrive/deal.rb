module Pipedrive

  class Deal < Base

    def self.all
      res = get "/deals"
      if res.ok?
        res['data'].map{|deal| Deal.new(deal)}
      else
        bad_response(res)
      end
    end

    def self.create( opts = {} )
      res = post "/deals", :body => opts
      if res.success?
        res['data'] = opts.merge res['data']
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
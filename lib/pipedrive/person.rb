module Pipedrive

  class Organisation < Base

    def self.create( opts = {} )
      res = post "/organisation", :body => opts
      if res.success?
        res['data'] = opts.merge res['data']
        Deal.new(res)
      else
        bad_response(res)
      end
    end

    def self.find(id)
      res = get "/organisation/#{id}"
      if res.ok?
        Organisation.new(res)
      else
        bad_response(res)
      end
    end

  end

end
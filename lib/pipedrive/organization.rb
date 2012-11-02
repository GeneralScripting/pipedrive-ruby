module Pipedrive

  class Organization < Base

    def self.create( opts = {} )
      res = post "/organization", :body => opts
      if res.success?
        res['data'] = opts.merge res['data']
        Organization.new(res)
      else
        bad_response(res)
      end
    end

    def self.find(id)
      res = get "/organization/#{id}"
      if res.ok?
        Organization.new(res)
      else
        bad_response(res)
      end
    end

  end

end
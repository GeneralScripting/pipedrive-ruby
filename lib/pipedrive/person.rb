module Pipedrive

  class Person < Base

    def self.create( opts = {} )
      res = post "/persons", :body => opts
      if res.success?
        res['data'] = opts.merge res['data']
        Person.new(res)
      else
        bad_response(res)
      end
    end

    def self.find(id)
      res = get "/persons/#{id}"
      if res.ok?
        Person.new(res)
      else
        bad_response(res)
      end
    end

    def self.find_by_name(opts = {})
      res = get "/persons/find", :query => opts
      if res.ok?
        Person.new(res)
      else
        bad_response(res)
      end
    end

  end

end
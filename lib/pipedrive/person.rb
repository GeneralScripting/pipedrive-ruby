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

    def self.find_or_create_by_name( name, opts={} )
      find_by_name( name, :org_id => opts[:org_id] ).first || create( opts.merge( :name => name ) )
    end

    def self.find(id)
      res = get "/persons/#{id}"
      if res.ok?
        Person.new(res)
      else
        bad_response(res)
      end
    end

    def self.find_by_name(name, opts={})
      res = get "/persons/find", :query => { :term => name }.merge(opts)
      if res.ok?
        Person.new_list(res)
      else
        bad_response(res)
      end
    end

  end

end
module Pipedrive
  class SearchResult < Base

    # Class Methods
    class << self
      
      def search(term, start=0, limit=nil)
        res = get(resource_path, :query => { :term => term, :start => start, :limit => limit})
        if res.ok?
          res['data'].nil? ? [] : res['data'].map{|obj| new(obj)}
        else
          bad_response(res,{:term=>term,:start=>start,:limit=>limit})
        end
      end
  
      def field(term, field_type, field_key, opts={})
        res = get("#{resource_path}/field", :query => opts.merge(:term => term, :field_type => field_type, :field_key => field_key) )
        if res.ok?
          res['data'].nil? ? [] : res['data'].map{|obj| new(obj)}
        else
          bad_response(res,{:term=>term,:field_type=>field_type,:field_key=>field_key}.merge(opts))
        end
      end
    
    end
    
  end
end
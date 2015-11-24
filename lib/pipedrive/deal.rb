module Pipedrive
  class Deal < Base

    def add_product(opts = {})
      res = post "#{resource_path}/#{id}/products", :body => opts
      res.success? ? res['data']['product_attachment_id'] : bad_response(res,opts)
    end

    def products
      Product.all(get "#{resource_path}/#{id}/products")
    end
    
    def remove_product product_attachment_id
      res = delete "#{resource_path}/#{id}/products", { :body => { :product_attachment_id => product_attachment_id } }
      res.success? ? nil : bad_response(res,product_attachment_id)
    end

    def activities
      Activity.all(get "#{resource_path}/#{id}/activities")
    end

    def files
      File.all(get "#{resource_path}/#{id}/files")
    end

    def notes(opts = {:sort_by => 'add_time', :sort_mode => 'desc'})
      Note.all( get("/notes", :query => opts.merge(:deal_id => id) ) )
    end

    def self.filter_deals(filter_id)
      res = get("#{resource_path}", :query => {:filter_id => filter_id})
      # res.ok? ? new(res) : bad_response(res,{:filter_id => filter_id})

      if res.ok?
          data = res['data'].nil? ? [] : res['data'].map{|obj| new(obj)}
          # if get_absolutely_all && res['additional_data']['pagination'] && res['additional_data']['pagination'] && res['additional_data']['pagination']['more_items_in_collection']
          #   options[:query] = options[:query].merge({:start => res['additional_data']['pagination']['next_start']})
          #   data += self.all(nil,options,true)
          # end
          data
      else
          bad_response(res,attrs)
      end
    end
    
  end
end

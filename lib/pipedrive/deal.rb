module Pipedrive
  class Deal < Base

    def add_product(opts = {})
      res = post "#{resource_path}/#{id}/products", :body => opts
      res.success? ? res['data']['product_attachment_id'] : bad_response(res,opts)
    end

    def products
      Product.all(get "#{resource_path}/#{id}/products")
    end

    def add_participant(person_id)
      res = post "#{resource_path}/#{id}/participants", body: { person_id: person_id }
      res.success? ? res['data'] : bad_response(res, opts)
    end

    def participants
      Person.all(get "#{resource_path}/#{id}/participants")
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

    class << self
      def search(term, fields: [])
        res = get("#{resource_path}/search", query: { term: term, fields: fields } )
        if res.ok?
          data = res['data'].nil? ? [] : res['data']['items'].map { |obj| new(obj['item']) }
        else
          bad_response(res, attrs)
        end
      end
    end
  end
end

module Pipedrive
  class Deal < Base

    def add_product(opts = {})
      res = post "#{resource_path}/#{id}/products", :body => opts
      res.success? ? res['data']['product_attachment_id'] : bad_response(res)
    end

    def products
      Product.all(get "#{resource_path}/#{id}/products")
    end

    def remove_product product_attachment_id
      res = delete "#{resource_path}/#{id}/products", { :body => { :product_attachment_id => product_attachment_id } }
      res.success? ? nil : bad_response(res)
    end
  end
end

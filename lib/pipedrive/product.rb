module Pipedrive
  class Product < Base
    class << self
      def create(opts = {})
        super(opts.to_json, {'Content-Type' => 'application/json'})
      end
    end
  end
end

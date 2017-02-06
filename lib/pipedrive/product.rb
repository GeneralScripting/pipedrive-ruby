module Pipedrive
  class Product < Base
    def update(opts = {})
      super(opts.to_json, {'Content-Type' => 'application/json'})
    end
    class << self
      def create(opts = {})
        super(opts.to_json, {'Content-Type' => 'application/json'})
      end
    end
  end
end

module Pipedrive
  class Deal < Base

    class << self

      private

      def resource_path
        '/deals'
      end

    end
  end
end
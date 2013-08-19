module Pipedrive
  class Note < Base

    class << self

      def add_note(opts={})
        create(opts)
      end

    end
  end
end
module Pipedrive
  class Organization < Base

    def persons
      Person.all(get "#{resource_path}/#{id}/persons")
    end

    def deals
      Deal.all(get "#{resource_path}/#{id}/deals")
    end

    class << self

      def find_or_create_by_name(name, opts={})
        find_by_name(name).first || create(opts.merge(:name => name))
      end

    end
  end
end

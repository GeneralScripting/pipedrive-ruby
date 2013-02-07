module Pipedrive
  class Organization < Base
    include Deals

    # TODO Rewrite this.
    def persons
      Person.all(get "#{resource_path}/#{id}/persons")
    end

    class << self

      def find_or_create_by_name(name, opts={})
        find_by_name(name).first || create(opts.merge(:title => name))
      end

    end
  end
end
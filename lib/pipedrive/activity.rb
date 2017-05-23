require 'date'

module Pipedrive
  class Activity < Base
    
    # Gets the date of the activity
    #
    # @return [DateTime]
    def date
      DateTime.parse(due_date + ' ' + due_time)
    end
    
  end
end
require 'date'

module Pipedrive
  class Activity < Base
    
    def date
      DateTime.parse(due_date + ' ' + due_time)
    end
    
  end
end
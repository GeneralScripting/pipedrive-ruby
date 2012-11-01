require 'pipedrive/base'
require 'pipedrive/deal'

module Pipedrive

  def self.authenticate(token)
    Base.authenticate(token)
  end

end
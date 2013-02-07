require 'pipedrive/base'
require 'pipedrive/deal'
require 'pipedrive/organization'
require 'pipedrive/person'
require 'pipedrive/product'

module Pipedrive

  def self.authenticate(token)
    Base.authenticate(token)
  end

end
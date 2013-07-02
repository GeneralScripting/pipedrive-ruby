require 'pipedrive/base'
require 'pipedrive/activity'
require 'pipedrive/deal'
require 'pipedrive/organization'
require 'pipedrive/person'
require 'pipedrive/product'
require 'pipedrive/pipeline'
require 'pipedrive/stage'

module Pipedrive

  def self.authenticate(token)
    Base.authenticate(token)
  end

end
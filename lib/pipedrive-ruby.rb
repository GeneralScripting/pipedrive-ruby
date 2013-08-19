require 'pipedrive/base'
require 'pipedrive/activity'
require 'pipedrive/deal'
require 'pipedrive/organization'
require 'pipedrive/person'
require 'pipedrive/organization-field'
require 'pipedrive/person-field'
require 'pipedrive/product'
require 'pipedrive/pipeline'
require 'pipedrive/stage'
require 'pipedrive/note'

module Pipedrive

  def self.authenticate(token)
    Base.authenticate(token)
  end

end
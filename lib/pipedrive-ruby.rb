require_relative 'pipedrive/base'
require 'pipedrive/activity'
require 'pipedrive/activity-type'
require 'pipedrive/authorization'
require 'pipedrive/currency'
require 'pipedrive/deal'
require 'pipedrive/deal-field'
require 'pipedrive/file'
require 'pipedrive/filter'
require 'pipedrive/note'
require 'pipedrive/organization'
require 'pipedrive/person'
require 'pipedrive/organization-field'
require 'pipedrive/person-field'
require 'pipedrive/permission-set'
require 'pipedrive/pipeline'
require_relative 'pipedrive/product'
require 'pipedrive/product-field'
require 'pipedrive/role'
require 'pipedrive/search-result'
require 'pipedrive/stage'
require 'pipedrive/user'
require 'pipedrive/user-setting'
require 'pipedrive/goal'
require 'pipedrive/user-connection'
require 'pipedrive/push-notification'

module Pipedrive

  def self.authenticate(token)
    Base.authenticate(token)
  end
end

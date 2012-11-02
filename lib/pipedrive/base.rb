require 'httparty'
require 'ostruct'

module Pipedrive
  
  # Globally set request headers
  HEADERS = {
    "User-Agent"    => "Ruby.Pipedrive.Api",
    "Accept"        => "application/json",
    "Content-Type"  => "application/x-www-form-urlencoded"
  }
  
  # Base class for setting HTTParty configurations globally
  class Base < OpenStruct
    
    include HTTParty
    base_uri 'api.pipedrive.com/v1'
    headers HEADERS
    format :json
    
    # Sets the authentication credentials in a class variable.
    #
    # @param [String] email cl.ly email
    # @param [String] password cl.ly password
    # @return [Hash] authentication credentials
    def self.authenticate(token)
      self.default_params :api_token => token
    end
    
    # Examines a bad response and raises an approriate exception
    #
    # @param [HTTParty::Response] response
    def self.bad_response(response)
      if response.class == HTTParty::Response
        raise response.inspect
        raise ResponseError, response
      end
      raise StandardError, "Unkown error"
    end
    
    attr_reader :data
    
    # Create a new CloudApp::Base object.
    #
    # Only used internally
    #
    # @param [Hash] attributes
    # @return [CloudApp::Base]
    def initialize(attrs = {})
      super( attrs['data'].is_a?(Hash) ? attrs['data'] : attrs['data'].first )
    end
    
  end  
  
end
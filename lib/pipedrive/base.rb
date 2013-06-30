require 'httparty'
require 'ostruct'
require 'forwardable'

module Pipedrive

  # Globally set request headers
  HEADERS = {
    "User-Agent"    => "Ruby.Pipedrive.Api",
    "Accept"        => "application/json",
    "Content-Type"  => "application/x-www-form-urlencoded"
  }

  # Base class for setting HTTParty configurations globally
  class Base < OpenStruct

    undef id

    include HTTParty
    base_uri 'api.pipedrive.com/v1'
    headers HEADERS
    format :json

    extend Forwardable
    def_delegators 'self.class', :delete, :get, :post, :put, :resource_path, :bad_response

    attr_reader :data

    # Create a new CloudApp::Base object.
    #
    # Only used internally
    #
    # @param [Hash] attributes
    # @return [CloudApp::Base]
    def initialize(attrs = {})
      if attrs['data']
        super( attrs['data'] )
      else
        super(attrs)
      end
    end

    # Updates the object.
    #
    # @param [Hash] opts
    # @return [Boolean]
    def update(opts = {})
      res = put "#{resource_path}/#{id}", :body => opts
      !!(res.success? && @table.merge!(res['data'].symbolize_keys))
    end

    class << self
      # Sets the authentication credentials in a class variable.
      #
      # @param [String] email cl.ly email
      # @param [String] password cl.ly password
      # @return [Hash] authentication credentials
      def authenticate(token)
        default_params :api_token => token
      end

      # Examines a bad response and raises an appropriate exception
      #
      # @param [HTTParty::Response] response
      def bad_response(response)
        if response.class == HTTParty::Response
          raise HTTParty::ResponseError, response
        end
        raise StandardError, 'Unknown error'
      end

      def new_list( attrs )
        attrs['data'].is_a?(Array) ? attrs['data'].map {|data| self.new( 'data' => data ) } : []
      end

      def all(response = nil)
        res = response || get(resource_path)
        if res.ok?
          res['data'].nil? ? [] : res['data'].map{|obj| new(obj)}
        else
          bad_response(res)
        end
      end

      def create( opts = {} )
        res = post resource_path, :body => opts
        if res.success?
          res['data'] = opts.merge res['data']
          new(res)
        else
          bad_response(res)
        end
      end

      def find(id)
        res = get "#{resource_path}/#{id}"
        res.ok? ? new(res) : bad_response(res)
      end

      def find_by_name(name, opts={})
        res = get "#{resource_path}/find", :query => { :term => name }.merge(opts)
        res.ok? ? new_list(res) : bad_response(res)
      end

      def resource_path
        "/#{name.split('::').last.downcase}s"
      end
    end

    # TODO Rewrite this.
    module Deals
      def deals
        Deal.all(get "#{resource_path}/#{id}/deals")
      end
    end
  end

end
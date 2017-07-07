require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require "shoulda"
# require 'mocha/setup'
require 'webmock/test_unit'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'pipedrive-ruby'

class Test::Unit::TestCase
  include ShouldaContextLoadable
  
  def stub method, resource, body_file_name, request_body=nil
    if method == :get
      uri = "https://api.pipedrive.com/v1/#{resource}?api_token=some-token"
      # Add request params to uri if any
      unless request_body.nil?
        uri += request_body.map{|k,v| "#{k}=#{v}"}.join('&')
      end
      # stub request
      request_stubbed = stub_request(:get, uri)
    else
      request_stubbed = stub_request(method, "https://api.pipedrive.com/v1/#{resource}?api_token=some-token")
    end
    
    request_stubbed.
      with(headers: request_headers).
      to_return(
        status: 200,
        body: File.read(File.join(File.dirname(__FILE__), "data", body_file_name)),
        headers: response_headers
      )
  end
  
  def request_headers
    {
      'Accept'=>'application/json',
      'Content-Type'=>'application/x-www-form-urlencoded',
      'User-Agent'=>'Ruby.Pipedrive.Api'
    }
  end
  
  def response_headers
    {
      "server" => "nginx/1.2.4",
      "date" => "Fri, 01 Mar 2013 14:01:03 GMT",
      "content-type" => "application/json",
      "content-length" => "1260",
      "connection" => "keep-alive",
      "access-control-allow-origin" => "*"
    }
  end
end

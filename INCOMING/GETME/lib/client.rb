# lib/client.rb
require 'net/http'
require 'uri'
require 'json'

def build_url(base_url, params)
  uri = URI.parse(base_url)
  uri.query = URI.encode_www_form(params)
  uri.to_s
end

def get_response(url)
  uri = URI.parse(url)
  Net::HTTP.get_response(uri)
end

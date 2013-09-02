# require 'twitter'
require 'debugger'
require_relative '../../app/models/link'
require_relative '../../app/models/tweet_parser'
require_relative '../../app/controllers/sessions_controller'
require "net/http"
require "net/https"
require "uri"

namespace :get_urls do

  task :links => :environment do

    Link.all.each do |link|
      @link.full_url = link.full_link(@link.shortened_url)
    end
  end
end



# def full_link(shortened_url)
#       url = shortened_url
#       uri = URI.parse(url)
#       response = Net::HTTP.get_response(uri)
#         until response.code == "200"
#           url = response.header['location']
#           puts url
#           uri = URI.parse(url)
#           if uri.scheme == "https"
#             http = Net::HTTP.new(uri.host, uri.port)
#             http.use_ssl = true
#             http.verify_mode = OpenSSL::SSL::VERIFY_NONE
#             request = Net::HTTP::Get.new(uri.request_uri)
#             response = http.request(request)
#           else
#             response = Net::HTTP.get_response(uri)
#         end
#       @link.full_url = url
#     end  
#   end
# #puts "Real URL is: #{url}"

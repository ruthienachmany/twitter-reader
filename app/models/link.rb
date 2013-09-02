#require 'HTTParty'
require "net/http"
require "net/https"
require "uri"

class Link < ActiveRecord::Base
   attr_accessible :shortened_url, :full_url, :time_posted_at
    attr_accessor :link
   belongs_to :user

  #  def initialize(link)
  #   @link = link
  # end

   # def render_link(@link)
      #Nokogiri::HTML(open(link))
      #use nethttp
      #HTTParty.get(link)
      #should i use open  uri?
      #how to render a whole page
      #puts response.body, response.code, response.message, response.headers.inspect
   # end

   def full_link(shortened_url)
      url = shortened_url
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
        until response.code == "200"
          url = response.header['location']
          puts url
          uri = URI.parse(url)
          if uri.scheme == "https"
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            request = Net::HTTP::Get.new(uri.request_uri)
            response = http.request(request)
          else
            response = Net::HTTP.get_response(uri)
        end
      Link.all.each do |entity|
        entity.full_url = url
      end
    end  
  end
#puts "Real URL is: #{url}"



  # end

end

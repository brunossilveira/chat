require 'net/http'

module Chat
  module API
    class Dialect
      BASE_API_URI = 'http://www.degraeve.com/cgi-bin/babel.cgi?'

      def self.translate(message, dialect)
        response = request(message, dialect)

        Response.new(response)
      end

      private

      def self.request(message, dialect)
        url = URI.parse(uri(message, dialect))

        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
          http.request(req)
        }

        res.body
      end

      def self.uri(message, dialect)
        "#{BASE_API_URI}d=#{dialect}&w=#{message}"
      end
    end

    class Response
      attr_reader :body

      def initialize(body)
        @body = Nokogiri::HTML(body)
      end

      def message
        body.css('p').text
      end
    end
  end
end

require 'api/dialect'

module Messages
  class Translator
    attr_reader :message, :dialect

    def initialize(message, dialect)
      @message = message
      @dialect = dialect
    end

    def call
      response = Chat::API::Dialect.translate(message, dialect)

      response.message if response
    end
  end
end

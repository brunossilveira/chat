module Messages
  class Translator
    attr_reader :message, :dialect

    def initialize(message, dialect)
      @message = message
      @dialect = dialect
    end

    def call
      #TODO call API and really translate the message
      "#{message} - #{dialect}"
    end
  end
end

module Exceptions
  class InvalidTweet < StandardError
    def message
      'Asking for an invalid tweet'
    end
  end
end

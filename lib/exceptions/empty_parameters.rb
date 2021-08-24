module Exceptions
  class EmptyParameters < StandardError
    def message
      'Please, specify the text to be tweetstormed as parameter.'
    end
  end
end

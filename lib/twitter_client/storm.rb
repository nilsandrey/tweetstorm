require 'exceptions/invalid_tweet'

module TwitterClient
  ##
  # We simplify the current implementation by considering the pager size as constant to
  # the size of the biggest pager (2/100 is shorter than 150/200) but as there's no
  # restriction to consider this we follow that version. Otherwise a less optimal version
  # should be made with a class instance for every tweet, with different size.
  # IMOF should an option should be made if you should take into account to don't
  # cut words or URLs. URLs should be shortened with an external service which is an added
  # complexity, or may be assuming to use the twitter shortened but it always take into
  # account a fixed size for the shortened URL even when it could be shorter for a given URL.
  class Storm
    MAX_CHARS = 140 # TODO: Actually twitter is now 280

    PREPEND_FIRST = "\n".freeze
    PREPEND_MIDDLE = "\n│\n├ ".freeze
    PREPEND_LAST = "\n│\n└ ".freeze

    attr_reader :content, :tweet_count

    ##
    # Recalculate the pieces
    def content=(value)
      @content = value
      update_tweets_size
    end

    def tweet_size
      MAX_CHARS - @pager_size
    end

    ##
    # Returns the content of one tweet between `0` and `tweet_count`.
    def tweet_content(index)
      raise Exceptions::InvalidTweet if index > tweet_count - 1 || index.negative?

      prepend(index) + format(content[index * tweet_size, tweet_size]) + pager(index)
    end

    ##
    # Use to_s for pretty-print the tweet storm
    def to_s
      str = ''
      i = 0
      while i < tweet_count
        str += tweet_content(i)
        i += 1
      end
      str
    end

    private

    ##
    # Recalculate the size of every tweet taking into account the max size of the
    # needed pager (2/10, 3/10, ...) which counts inside de `MAX_CHARS`.
    def update_tweets_size
      total = content.length
      tweets = nil
      new_tweets = total / MAX_CHARS + ((total % MAX_CHARS).positive? ? 1 : 0)
      while new_tweets != tweets
        tweets = new_tweets # Tweets count
        pager_size = tweets.to_s.length * 2 + 2 # ' 45/45' --> 6
        real_total = pager_size * tweets + total
        new_tweets = real_total / MAX_CHARS + ((real_total % MAX_CHARS).positive? ? 1 : 0)
      end

      @tweet_count = tweets
      @pager_size = tweet_count.to_s.length * 2 + 2 # ' 45/45' --> 6
    end

    def pager(index)
      tweet_count > 1 ? " #{index + 1}/#{tweet_count}" : ''
    end

    ##
    # TODO: Treat CR/LF with parametrized options.
    def prepend(index)
      return PREPEND_FIRST if index.zero?
      return PREPEND_MIDDLE if index.positive? && index < tweet_count - 1

      PREPEND_LAST if index == tweet_count - 1
    end

    ##
    # TODO: Do similar formatting than twitter ;)
    def format(content)
      content
    end
  end
end

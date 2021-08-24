require "minitest/autorun"
require "twitter_client/storm"

class StormTest < Minitest::Test
  def setup
    @storm = TwitterClient::Storm.new
    @storm.content = "Magna eros augue tellus leo. Nisl massa auctor sollicitudin dolor placerat aptent consectetur aliquet massa pulvinar. Accumsan, ultrices penatibus dictumst accumsan habitasse tortor suspendisse! Lacinia habitant imperdiet augue lacinia taciti netus. Ante arcu ridiculus mi vehicula massa nibh nisl dis. Orci mi tempus pharetra molestie aenean magna venenatis aenean turpis. Convallis vehicula rhoncus."
  end

  def test_tweet1
    assert_equal(@storm.tweet_size, 136)
  end

  def test_chage
    @storm.content = "Just One"
    assert_equal(@storm.tweet_count, 1)
  end

  ##
  # Should raise an exception if asking for a tweet over the count.
  def test_extra_tweet
    assert_raises(Exceptions::InvalidTweet) { @storm.tweet_content(25) }
  end
end

require "minitest/autorun"
require "twitter_client/storm"

class StormSpy < TwitterClient::Storm
  def prepend_test(i)
    prepend(i)
  end

  def pager_test(i)
    pager(i)
  end
end

class StormInternalsTest < Minitest::Test
  def setup
    @spy = StormSpy.new
    @spy.content= 'Magna eros augue tellus leo. Nisl massa auctor sollicitudin dolor placerat aptent consectetur aliquet massa pulvinar. Accumsan, ultrices penatibus dictumst accumsan habitasse tortor suspendisse! Lacinia habitant imperdiet augue lacinia taciti netus. Ante arcu ridiculus mi vehicula massa nibh nisl dis. Orci mi tempus pharetra molestie aenean magna venenatis aenean turpis. Convallis vehicula rhoncus.'
  end

  def test_prepend
    assert_equal(@spy.prepend_test(0), StormSpy::PREPEND_FIRST)
    assert_equal(@spy.prepend_test(1), StormSpy::PREPEND_MIDDLE)
    assert_equal(@spy.prepend_test(2), StormSpy::PREPEND_LAST)
  end

  def test_pager
    assert_equal(@spy.pager_test(0), ' 1/3')
    assert_equal(@spy.pager_test(1), ' 2/3')
    assert_equal(@spy.pager_test(2), ' 3/3')
  end
end

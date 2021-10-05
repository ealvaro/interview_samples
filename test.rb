require 'byebug'
require 'minitest/autorun'
require './hashy.rb'

class TestHashy < Minitest::Test

  def test_fetch_simple_case

    h = Hashy.new()
    h["a"] = 100
    # byebug
    # puts h.inspect
    assert_equal 100, h.fetch("a")
  end

  def test_fetch_none_existing_key

    h = Hashy.new()
    h["a"] = 100
    # byebug
    # puts h.inspect
    assert_raises(KeyError) {h.fetch("z")}

  end

  def test_fetch_none_existing_key_with_default_value

    h = Hashy.new()
    h["a"] = 100
    # byebug
    # puts h.inspect
    assert_equal "go fish", h.fetch("z","go fish")

  end

end

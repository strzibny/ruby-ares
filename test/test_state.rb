# encoding: UTF-8

require 'minitest/autorun'
require 'ruby-ares/state'

class RubyARESStateTest < Minitest::Test

  def setup
    @state = RubyARES::State.new("Aktivní", 0, 0, 0, 0)
  end

  def test_state
    assert_equal :active, @state.state
  end

  def test_mappings
    assert_equal 'není a nebyl', RubyARES::State.kvz_to_str(@state.liquidation)
  end

end

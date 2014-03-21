# encoding: UTF-8

require 'minitest/autorun'
require 'ruby-ares/address'

class RubyARESAddressTest < Minitest::Test

  def setup
    @address = RubyARES::Address.new(1, 'Kunzova', '10010', 'Brno', 'Královo pole', 1, 1, nil)
  end

  def test_address_to_string
    assert_equal "Kunzova 1\n10010 Brno\nKrálovo pole\n", @address.to_str
  end

  def test_address_street_line
    assert_equal "Kunzova 1", @address.street_line
  end

  def test_address_city_line
    assert_equal "10010 Brno", @address.city_line
  end
end

# encoding: UTF-8

require 'minitest/autorun'
require 'ruby-ares/case_reference'

class RubyARESCaseReferenceTest < Minitest::Test

  def setup
    @case_reference = RubyARES::CaseReference.new("Krajský soud v Plzni","D","1234")
  end

  def test_address_to_string
    assert_equal "Krajský soud v Plzni D 1234", @case_reference.to_str
  end

end

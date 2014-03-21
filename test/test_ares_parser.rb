# encoding: UTF-8

require 'minitest/autorun'
require 'helper'
require 'ruby-ares/parser'

class RubyARESParserTest < Minitest::Test

  def test_parser_should_fail
    assert_raises(RubyARES::Parser::ARESDatabaseError) {
      RubyARES::Parser.get_subject(RubyARESTestHelper.error_responce_xml)
    }
  end
end

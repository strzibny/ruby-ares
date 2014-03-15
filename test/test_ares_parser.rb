# encoding: UTF-8

require 'test/unit'
require 'helper'
require 'ruby-ares/parser'

class RubyARESParserTest < Test::Unit::TestCase

  def test_parser_should_fail
    assert_raise(RubyARES::Parser::ARESDatabaseError) {
      RubyARES::Parser.get_subject(RubyARESTestHelper.error_responce_xml)
    }
  end
end

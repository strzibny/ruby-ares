# encoding: UTF-8

require 'minitest/autorun'
require 'helper'
require 'ruby-ares'

class RubyARESTest < Minitest::Test
  def setup
    @subject = RubyARES::Parser.get_subject RubyARESTestHelper.subject_xml
  end

  def test_subject_address_house_number
    assert_equal '778 1', "#{@subject.addresses[0].house_number} #{@subject.addresses[0].house_number_type}"
  end

  def test_subject_address_street
    assert_equal 'Budějovická 3a/778', "#{@subject.addresses[0].street} #{@subject.addresses[0].street_number}"
  end

  def test_subject_address_city
    assert_equal 'Praha Michle', "#{@subject.addresses[0].city} #{@subject.addresses[0].city_part}"
  end

  def test_subject_address_postcode
    assert_equal '14000', @subject.addresses[0].postcode
  end

  def test_subject_name
    assert_equal 'Asseco Central Europe, a.s.', @subject.name
  end

  def test_subject_dic
    assert_equal 'CZ27074358', @subject.dic
  end

  def test_subject_ic
    assert_equal '27074358', @subject.ic
  end

  def test_subject_legal_form
    assert_equal 'Akciová společnost', @subject.legal_form
  end

  def test_subject_legal_form_id
    assert_equal '121', @subject.legal_form_id
  end

  def test_subject_status
    assert_equal 'Aktivní', @subject.status
  end

  def test_number_of_subject_addresses
    assert_equal 1, @subject.addresses.size
  end

  def test_case_reference_place
    assert_equal 'Městský soud v Praze', @subject.case_reference.place
  end

  def test_case_reference_section
    assert_equal 'B', @subject.case_reference.section
  end

  def test_case_reference_insert
    assert_equal '8525', @subject.case_reference.insert
  end

end

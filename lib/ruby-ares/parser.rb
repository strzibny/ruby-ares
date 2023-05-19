# encoding: utf-8

require 'xml'
require 'libxml'
require 'ruby-ares/subject'

module RubyARES
  class Parser

    class ARESDatabaseError < StandardError; end
    class ParseError < StandardError; end

    def self.get_subject(xml)
      begin
        doc = self.parse_document xml

        # Basic info
        doc.find('//D:VBAS').each do |node|
          # Attributes of the subject
          @status = node.find("D:ROR/D:SOR/D:SSU").to_a[0]&.content
          @ic = node.find('D:ICO').to_a[0]&.content
          @dic = node.find('D:DIC').to_a[0]&.content
          @name = node.find('D:OF').to_a[0]&.content
          @legal_form = node.find('D:PF/D:NPF').to_a[0]&.content
          @legal_form_id = node.find('D:PF/D:KPF').to_a[0]&.content

          place = node.find('//D:SZ/D:SD/D:T').to_a[0]&.content
          record = node.find('//D:SZ/D:OV').to_a[0]&.content
          section, insert = record.split if record

          @case_reference = RubyARES::CaseReference.new(place, section, insert)
        end

        # Corresponding addresses
        @addresses = self.find_addresses doc
      rescue
        raise ParseError, "Can't parse the given document."
      end

      if doc.find('//D:E').to_a.size > 0
        raise ARESDatabaseError, 'ARES returned an error.'
      end

      # Create and return subject
      return RubyARES::Subject.new(@ic, @dic, @name, @status, @addresses, @updated_at, @legal_form, @legal_form_id, @case_reference)
    end

    protected

      def self.find_addresses(doc)
        @addresses = []

        doc.find('//D:AA').each do |node|
          id = node.find('D:IDA').to_a[0].content
          street = node.find('D:NU').to_a[0]&.content
          postcode = node.find('D:PSC').to_a[0]&.content
          city = node.find('D:N').to_a[0]&.content
          city_part = node.find('D:NCO').to_a[0]&.content
          house_number = node.find('D:CD').to_a[0]&.content
          house_number_type = node.find('D:TCD').to_a[0]&.content
          orientational_number = node.find('D:CO').to_a[0]&.content

          @addresses << RubyARES::Address.new(id, street, postcode, city, city_part,
                                          house_number, house_number_type, orientational_number)
        end

        return @addresses
      end

      def self.parse_document(xml)
        parser = XML::Parser.string xml
        parser.parse
      end
  end
end

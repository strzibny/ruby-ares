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
          attrs = node.children()

          # Attributes of the subject
          @status = node.find("D:ROR/D:SOR/D:SSU").to_a[0].content unless node.find('D:ROR/D:SOR/D:SSU').to_a.size == 0
          @ic = node.find('D:ICO').to_a[0].content unless node.find('D:ICO').to_a.size == 0
          @dic = node.find('D:DIC').to_a[0].content unless node.find('D:DIC').to_a.size == 0
          @name = node.find('D:OF').to_a[0].content unless node.find('D:OF').to_a.size == 0
          @legal_form = node.find('D:PF/D:NPF').to_a[0].content unless node.find('D:PF/D:NPF').to_a.size == 0
          @legal_form_id = node.find('D:PF/D:KPF').to_a[0].content unless node.find('D:PF/D:KPF').to_a.size == 0

          place = node.find('//D:SZ/D:SD/D:T').to_a[0].content unless node.find('//D:SZ/D:SD/D:T').to_a.size == 0
          record = node.find('//D:SZ/D:OV').to_a[0].content unless node.find('//D:SZ/D:OV').to_a.size == 0
          section, insert = record.split if record
          state = node.find('//D:SOR/D:SSU').to_a[0].content unless node.find('//D:SOR/D:SSU').to_a.size == 0
          bankruptcy = node.find('//D:SOR/D:KKZ/D:K').to_a[0].content unless node.find('//D:SOR/D:KKZ/D:K').to_a.size == 0
          compensation = node.find('//D:SOR/D:VY/D:K').to_a[0].content unless node.find('//D:SOR/D:VY/D:K').to_a.size == 0
          refusal = node.find('//D:SOR/D:ZAM/D:K').to_a[0].content unless node.find('//D:SOR/D:ZAM/D:K').to_a.size == 0
          liquidation = node.find('//D:SOR/D:LI/D:K').to_a[0].content unless node.find('//D:SOR/D:LI/D:K').to_a.size == 0

          @case_reference = RubyARES::CaseReference.new(place, section, insert)
          @state = RubyARES::State.new(state, bankruptcy, compensation, refusal, liquidation)
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
      return RubyARES::Subject.new(@ic, @dic, @name, @status, @addresses, @updated_at, @legal_form, @legal_form_id, @case_reference, @state)
    end

    protected

      def self.find_addresses(doc)
        @addresses = []

        doc.find('//D:AA').each do |node|
          id = node.find('D:IDA').to_a[0].content
          street = node.find('D:NU').to_a[0].content unless node.find('D:NU').to_a.size == 0
          postcode = node.find('D:PSC').to_a[0].content unless node.find('D:PSC').to_a.size == 0
          city = node.find('D:N').to_a[0].content unless node.find('D:N').to_a.size == 0
          city_part = node.find('D:NCO').to_a[0].content unless node.find('D:NCO').to_a.size == 0
          house_number = node.find('D:CD').to_a[0].content unless node.find('D:CD').to_a.size == 0
          house_number_type = node.find('D:TCD').to_a[0].content unless node.find('D:TCD').to_a.size == 0
          orientational_number = node.find('D:CO').to_a[0].content unless node.find('D:CO').to_a.size == 0
          county = node.find('D:NOK').to_a[0].content unless node.find('D:NOK').to_a.size == 0

          @addresses << RubyARES::Address.new(id, street, postcode, city, city_part,
                                          house_number, house_number_type, orientational_number, county)
        end

        return @addresses
      end

      def self.parse_document(xml)
        parser = XML::Parser.string xml
        parser.parse
      end
  end
end

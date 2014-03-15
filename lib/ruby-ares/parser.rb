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
        doc.find('//dtt:Zakladni_udaje').each do |node|
          attrs = node.children()

          # Attributes of the subject
          @status = node.find('dtt:Stav').to_a[0].content unless node.find('dtt:Stav') == 0
          @updated_at = node.find('dtt:Datum_zmeny').to_a[0].content unless node.find('dtt:Datum_zmeny').to_a.size == 0
          @ic = node.find('dtt:ICO').to_a[0].content
          @dic = node.find('dtt:DIC').to_a[0].content unless node.find('dtt:DIC').to_a.size == 0
          @name = node.find('dtt:Obchodni_firma').to_a[0].content unless node.find('dtt:Obchodni_firma').to_a.size == 0
        end

        # Corresponding addresses
        @addresses = self.find_addresses doc
      rescue
        raise ParseError, "Can't parse the given document."
      end

      if doc.find('//dtt:Error').to_a.size > 0
        raise ARESDatabaseError, 'ARES returned an error.'
      end

      # Create and return subject
      return RubyARES::Subject.new(@ic, @dic, @name, @status, @addresses, @updated_at)
    end

    protected

      def self.find_addresses(doc)
        @addresses = []

        doc.find('//dtt:Adresa').each do |node|
          id = node.find('dtt:ID_adresy').to_a[0].content
          street = node.find('dtt:Nazev_ulice').to_a[0].content unless node.find('dtt:Nazev_ulice').to_a.size == 0
          postcode = node.find('dtt:PSC').to_a[0].content unless node.find('dtt:PSC').to_a.size == 0
          city = node.find('dtt:Nazev_obce').to_a[0].content unless node.find('dtt:Nazev_obce').to_a.size == 0
          city_part = node.find('dtt:Nazev_casti_obce').to_a[0].content unless node.find('dtt:Nazev_casti_obce').to_a.size == 0
          house_number = node.find('dtt:Cislo_domovni').to_a[0].content unless node.find('dtt:Cislo_domovni').to_a.size == 0
          house_number_type = node.find('dtt:Typ_cislo_domovni').to_a[0].content unless node.find('dtt:Typ_cislo_domovni').to_a.size == 0
          orientational_number = node.find('dtt:Cislo_orientacni').to_a[0].content unless node.find('dtt:Cislo_orientacni').to_a.size == 0

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

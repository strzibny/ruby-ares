require 'nokogiri'
require 'ruby-ares/subject'

module RubyARES
	class Parser

		class ARESDatabaseError < StandardError; end
		class ParseError < StandardError; end

		def self.get_subject(xml)
			begin
				doc = self.parse_document xml

				# Basic info
				doc.xpath('//dtt:Zakladni_udaje').each do |node|
					attrs = node.children()

					# Attributes of the subject
					@status = node.xpath('dtt:Stav').first.content unless node.find('dtt:Stav') == 0
					@updated_at = node.xpath('dtt:Datum_zmeny').first.content unless node.xpath('dtt:Datum_zmeny').empty?
					@ic = node.xpath('dtt:ICO').first.content
					@dic = node.xpath('dtt:DIC').first.content unless node.xpath('dtt:DIC').empty?
					@name = node.xpath('dtt:Obchodni_firma').first.content unless node.xpath('dtt:Obchodni_firma').empty?
				end

				# Corresponding addresses
				@addresses = self.find_addresses doc
			rescue
				raise ParseError, "Can't parse the given document."
			end

			unless doc.xpath('//dtt:Error').empty?
				raise ARESDatabaseError, 'ARES returned an error.'
			end

			# Create and return subject
			RubyARES::Subject.new(@ic, @dic, @name, @status, @addresses, @updated_at)
		end

		protected

		def self.find_addresses(doc)
			doc.xpath('//dtt:Adresa').map do |node|
				id = node.xpath('dtt:ID_adresy').first.content
				street = node.xpath('dtt:Nazev_ulice').first.content unless node.xpath('dtt:Nazev_ulice').empty?
				postcode = node.xpath('dtt:PSC').first.content unless node.xpath('dtt:PSC').empty?
				city = node.xpath('dtt:Nazev_obce').first.content unless node.xpath('dtt:Nazev_obce').empty?
				city_part = node.xpath('dtt:Nazev_casti_obce').first.content unless node.xpath('dtt:Nazev_casti_obce').empty?
				house_number = node.xpath('dtt:Cislo_domovni').first.content unless node.xpath('dtt:Cislo_domovni').empty?
				house_number_type = node.xpath('dtt:Typ_cislo_domovni').first.content unless node.xpath('dtt:Typ_cislo_domovni').empty?
				orientational_number = node.xpath('dtt:Cislo_orientacni').first.content unless node.xpath('dtt:Cislo_orientacni').empty?

				RubyARES::Address.new(id, street, postcode, city, city_part, house_number, house_number_type, orientational_number)
			end
		end

		def self.parse_document(xml)
			Nokogiri.XML(xml)
		end
	end
end

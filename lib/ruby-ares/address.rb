# encoding: utf-8

module RubyARES
  class Address
    attr_reader :id,                    # ID_adresy
                :city,                  # nazev_obce
                :city_part,             # Nazev_casti_obce
                :street,                # Nazev_ulice
                :house_number,          # Cislo_domovni
                :house_number_type,     # Typ_cislo_domovni
                :orientational_number,  # Cislo_orientacni
                :postcode,               # PSC
                :county                 # Okres

    def initialize(id, street, postcode, city, city_part,
                   house_number, house_number_type, orientational_number, county)
      @id = id
      @street = street
      @postcode = postcode
      @city = city
      @city_part = city_part
      @house_number = house_number
      @house_number_type = house_number_type
      @orientational_number = orientational_number
      @county = county
    end

    def to_str
<<EOF
#{self.street.nil? ? self.city_part : self.street} #{self.street_number}
#{self.postcode} #{self.city}
#{self.city_part == self.city ? "" : self.city_part}
EOF
    end

    def street_number
      unless @orientational_number
        @house_number
      else
        "#{@orientational_number}/#{@house_number}"
      end
    end

    def street_line
      "#{@street} #{street_number}"
    end

    def city_line
      "#{@postcode} #{@city}"
    end
  end
end

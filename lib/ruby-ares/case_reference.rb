# encoding: utf-8

module RubyARES
  class CaseReference
    attr_reader :place,                 # Misto zapisu
                :section,               # Oddil
                :insert                 # Vlozka

    def initialize(place, section, insert)
      @place = place
      @section = section
      @insert = insert
    end

    def to_str
      "#{self.place} #{self.section} #{self.insert}"
    end

  end
end

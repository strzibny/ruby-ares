# encoding: utf-8

module RubyARES
  class State
    MAPPINGS_STATE = {
      "Aktivní" => :active,
      "Zaniklý" => :closed
    }.freeze

    MAPPINGS_KVZ = {
      0 => 'není a nebyl',
      1 => 'poslední nastal(-a) před více než rokem od této aktualizace',
      2 => 'poslední nastal(-a) před méně než rokem a více než půlrokem od této aktualizace',
      3 => 'poslední nastal(-a) před méně než půlrokem od této aktualizace',
      4 => 'poslední nastal(-a) právě při této aktualizaci'
    }.freeze

    attr_reader :state,                 # Stav
                :bankruptcy,            # Konkurz
                :compensation,          # Vyrovnani
                :refusal,                # Zamitnuti
                :liquidation            # Likvidace

    def initialize(state, bankruptcy, compensation, refusal, liquidation)
      @state = MAPPINGS_STATE[state]
      @bankruptcy = bankruptcy.to_i
      @compensation = compensation.to_i
      @refusal = refusal.to_i
      @liquidation = liquidation.to_i
    end

    def self.kvz_to_str(kvz_id)
      MAPPINGS_KVZ[kvz_id.to_i]
    end

  end
end

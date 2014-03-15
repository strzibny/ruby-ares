# encoding: utf-8

require 'net/http'

module RubyARES
  class HTTP

    class ConnectionError < StandardError; end

    def self.fetch_subject_xml(ic)
      # Get a subject info from ARES[http://wwwinfo.mfcr.cz/ares/]
      uri = URI('http://wwwinfo.mfcr.cz/cgi-bin/ares/darv_rzp.cgi')
      params = { :ico => ic, :ver => '1.0.4' }
      uri.query = URI.encode_www_form(params)

      begin
        res = Net::HTTP.get_response uri
        @xml = res.body if res.is_a? Net::HTTPSuccess
      rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
             Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
        raise ConnectionError, e
      end
    end
  end
end

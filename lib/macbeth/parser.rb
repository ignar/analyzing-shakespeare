# frozen_string_literal: true

require 'nokogiri'

module Macbeth
  class Parser
    def initialize(io, analyzer)
      @source_io = io
      @analyzer = analyzer
    end

    def parse
      xml = Nokogiri::XML(source_io)
      xml.xpath('//SPEECH/SPEAKER').each do |element|
        analyzer.add(element.text)
      end
      analyzer
    end

    private

    attr_reader :source_io, :analyzer
  end
end

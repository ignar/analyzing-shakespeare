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
      xml.xpath('//SPEECH').each do |element|
        speaker = element.at('SPEAKER')
        lines = element.xpath('LINE')
        analyzer.add(speaker: speaker.text, count: lines.count)
      end
      analyzer
    end

    private

    attr_reader :source_io, :analyzer
  end
end

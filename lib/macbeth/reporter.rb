# frozen_string_literal: true

module Macbeth
  class Reporter
    def self.report(analyzer, output = STDOUT)
      analyzer.each do |k, v|
        output.write "#{v} #{k}\n"
      end
    end
  end
end

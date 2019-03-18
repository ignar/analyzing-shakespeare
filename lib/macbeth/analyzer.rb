# frozen_string_literal: true

module Macbeth
  class Analyzer
    IGNORE_LIST = %w[All].freeze

    attr_reader :counter

    def initialize
      @counter = Hash.new(0)
    end

    def each
      return to_enum(:each) unless block_given?

      sorted_by_value = counter.sort_by { |_, v| v }
      sorted_by_value.reverse_each do |k, v|
        yield(k, v)
      end
    end

    def add(speaker: , count: )
      normalized_name = speaker.capitalize
      return 0 if IGNORE_LIST.include?(normalized_name)

      counter[normalized_name] += count
    end
  end
end

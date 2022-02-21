# frozen_string_literal: true

module ParseableEntity
  class BaseParseable
    attr_reader :source, :parsing_rules

    def initialize(source:, parsing_rules:)
      @source = source
      @parsing_rules = parsing_rules
    end

    def parse
      raise NotImplementedError
    end
  end
end

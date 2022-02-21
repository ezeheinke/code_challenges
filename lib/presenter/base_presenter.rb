# frozen_string_literal: true

module Presenter
  class BasePresenter
    class ParsingError < StandardError; end
    attr_reader :parsed_entity

    def initialize(parseable_entity)
      @parseable_entity = parseable_entity
      @parsed_entity = @parseable_entity.parse

      raise ParsingError, 'The object could not be parsed.' if parsed_entity.empty?
    end
  end
end

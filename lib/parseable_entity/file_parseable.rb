# frozen_string_literal: true

module ParseableEntity
  class FileParseable < BaseParseable
    class FileMissing < StandardError; end

    def parse
      raise FileMissing, 'The file provided does not exist' unless File.file?(source)

      parsed_file = []
      IO.foreach(source) do |file_line|
        parsed_file << parse_line(file_line) unless parsing_rules.invalid_line?(file_line)
      end
      parsed_file
    end

    private

    def parse_line(valid_file_line)
      visited_page, user_id = valid_file_line.split(parsing_rules.separator)
      { visited_page: visited_page, user_id: user_id }
    end
  end
end

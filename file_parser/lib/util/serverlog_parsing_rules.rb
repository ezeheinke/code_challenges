# frozen_string_literal: true

module Util
  class ServerlogParsingRules
    class << self
      ACCEPTED_FORMAT = %r{^((/[\w-]+/?)+\s[0-9]{1,3}(?:\.[0-9]{1,3}){3})$}.freeze

      def separator
        ' '
      end

      def invalid_line?(line)
        (line =~ ACCEPTED_FORMAT).nil?
      rescue StandardError => e
        # NOTE: maybe raise sentry with the e.message or log
        true
      end
    end
  end
end

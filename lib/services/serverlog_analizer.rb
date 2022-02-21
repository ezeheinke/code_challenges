# frozen_string_literal: true

module Services
  class ServerlogAnalizer
    attr_reader :serverlog_presenter

    def initialize(file_path)
      serverlog_parseable = ParseableEntity::FileParseable.new(source: file_path,
                                                               parsing_rules: Util::ServerlogParsingRules)
      @serverlog_presenter = Presenter::FilePresenter.new(serverlog_parseable)
    end

    def get_page_views(desc: true)
      serverlog_presenter.group_views(desc: desc, &:size)
    end

    def get_page_uniq_views(desc: true)
      serverlog_presenter.group_views(desc: desc) { |value| value.uniq.size }
    end
  end
end

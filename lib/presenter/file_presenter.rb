# frozen_string_literal: true

module Presenter
  class FilePresenter < BasePresenter
    def group_views(desc:, &block)
      raise ArgumentError unless block_given?

      views_per_page = parsed_entity.group_by { |line_tuple| line_tuple[:visited_page] }.transform_values(&block)
      sort(views: views_per_page, desc: desc)
    end

    private

    def sort(views:, desc:)
      sorted = views.sort_by { |(_, v)| v }
      sorted.reverse! if desc
      sorted
    end
  end
end

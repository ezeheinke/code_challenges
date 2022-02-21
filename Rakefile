# frozen_string_literal: true

require 'optparse'
require_relative 'lib/smart_pension'

namespace :server_parser do
  desc 'This will return the most viewed pages sorted in descendant way'
  task :sorted_page_views do
    usage_message = 'Usage: rake server_parser:sorted_page_views  -- --file_name=file_name'
    parameters = {}
    option_parser = OptionParser.new
    option_parser.banner = usage_message

    option_parser.on('--file_name file', String, 'File to process') do |file_name|
      parameters[:file_name] = file_name.to_s
    end
    args = option_parser.order!(ARGV) {}
    option_parser.parse!(args)
    raise usage_message if parameters[:file_name].nil?

    begin
      puts Services::ServerlogAnalizer.new(parameters[:file_name]).get_page_views(desc: true)
    rescue StandardError => e
      puts e.message
    end
  end

  desc 'This will return the most viewed pages per user sorted in descendant way'
  task :sorted_uniq_page_views do
    usage_message = 'Usage: rake server_parser:sorted_uniq_page_views  -- --file_name=file_name'
    parameters = {}
    option_parser = OptionParser.new
    option_parser.banner = usage_message

    option_parser.on('--file_name file', String, 'File to process') do |file_name|
      parameters[:file_name] = file_name.to_s
    end
    args = option_parser.order!(ARGV) {}
    option_parser.parse!(args)
    raise usage_message if parameters[:file_name].nil?

    begin
      puts Services::ServerlogAnalizer.new(parameters[:file_name]).get_page_uniq_views(desc: true)
    rescue StandardError => e
      puts e.message
    end
  end
end

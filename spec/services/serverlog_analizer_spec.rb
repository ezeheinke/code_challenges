# frozen_string_literal: true

require 'spec_helper'

describe Services::ServerlogAnalizer do
  subject { described_class.new('webserver.log') }
  describe '#get_page_views' do
    let(:expected_result) do
      [['/about/2', 90], ['/contact', 89], ['/index', 82], ['/about', 81], ['/help_page/1', 80], ['/home', 78]]
    end
    it do
      expect(subject.get_page_views).to eq(expected_result)
    end
  end

  describe '#get_page_uniq_views' do
    let(:expected_result) do
      [['/index', 23], ['/home', 23], ['/contact', 23], ['/help_page/1', 23], ['/about/2', 22], ['/about', 21]]
    end
    it do
      expect(subject.get_page_uniq_views).to eq(expected_result)
    end
  end
end

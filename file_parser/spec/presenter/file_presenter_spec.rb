# frozen_string_literal: true

require 'spec_helper'

describe Presenter::FilePresenter do
  subject { described_class.new(parseable_entity) }
  describe '.new' do
    context 'when the file could not be parsed' do
      let(:parseable_entity) { double(:parseable_entity, parse: []) }

      it do
        expect { subject }.to raise_error(Presenter::BasePresenter::ParsingError, 'The object could not be parsed.')
      end
    end

    context 'when constructor goes well' do
      let(:parseable_entity) { double(:parseable_entity, parse: ['file parsed']) }
      it { expect(subject).to be_a(Presenter::FilePresenter) }
    end
  end

  describe '#group_views' do
    let(:parseable_entity) do
      ParseableEntity::FileParseable.new(parsing_rules: Util::ServerlogParsingRules, source: 'webserver.log')
    end
    context 'when a block is not given' do
      it do
        expect { subject.group_views(desc: true) }.to raise_error(ArgumentError)
      end
    end

    context 'when block is given' do
      context 'and we sort desceding' do
        let(:expected_result) do
          [['/about/2', 90], ['/contact', 89], ['/index', 82], ['/about', 81], ['/help_page/1', 80], ['/home', 78]]
        end
        it do
          expect(subject.group_views(desc: true, &:size)).to eq(expected_result)
        end
      end
      context 'and we sort ascending' do
        let(:expected_result) do
          [['/home', 78], ['/help_page/1', 80], ['/about', 81], ['/index', 82], ['/contact', 89], ['/about/2', 90]]
        end
        it do
          expect(subject.group_views(desc: false, &:size)).to eq(expected_result)
        end
      end
    end
  end
end

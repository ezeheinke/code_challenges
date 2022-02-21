# frozen_string_literal: true

require 'spec_helper'

describe Util::ServerlogParsingRules do
  describe '.invalid_line?' do
    subject { described_class.invalid_line?(line) }
    context 'when the format is not supported' do
      let(:line) { 'something invalid' }

      it { expect(subject).to eq(true) }
    end

    context 'when the format is supported' do
      let(:line) { '/help_page/1 929.398.951.889' }

      it { expect(subject).to eq(false) }
    end
  end
end

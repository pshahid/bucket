require 'rails_helper'

describe Bucket::Postprocessors::ReplaceWho do
  let(:processor) { described_class.new }

  describe '#process' do
    let(:message_response) do
      MessageResponse.new(
        text: text,
        trigger: 'You go, girl!',
        speaker: 'Quandi',
      )
    end

    context 'when $who is present' do
      let(:text) { '$who did it! $who!' }

      it 'replaces $who with the speaker’s name' do
        processor.process(message_response)

        expect(message_response.text).to eq 'Quandi did it! Quandi!'
      end

      it 'returns nil' do
        expect(processor.process(message_response)).to eq nil
      end
    end

    context 'when $who is not present' do
      let(:text) { 'not present' }

      it 'returns nil' do
        expect(processor.process(message_response)).to eq nil
      end
    end
  end
end

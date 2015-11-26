require 'rails_helper'

describe 'Replacing $who with the speaker' do
  before do
    create(:fact, trigger: 'alpha', result: 'bravo, $who, bravo')
  end

  it 'replaces $who with the speaker’s name' do
    slack_post text: 'alpha'

    expect(text).to eq 'bravo, M2K, bravo'
  end

  it 'responds with 200 OK' do
    slack_post text: 'alpha'

    expect(response.status).to eq 200
  end
end

require 'rails_helper'

describe SlackMessage do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:token) }
    it do
      is_expected
        .to validate_inclusion_of(:token)
        .in_array([Rails.application.secrets[:slack_triggers_token]])
    end
  end
end

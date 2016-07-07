class SlackMessage < Message
  attr_accessor :token

  def initialize(options = {})
    @token = options[:token]
    @user_name = options[:user_name]
    @text = options[:text]
  end

  validates :token, presence: true, inclusion: {
    in: [Rails.application.secrets[:slack_triggers_token]]
  }
end

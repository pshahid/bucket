class Message
  include ActiveModel::Validations

  attr_accessor :user_name, :text, :addressed

  def initialize(options = {})
    @user_name = options[:user_name]
    @text = options[:text]
    @addressed = options[:addressed]
  end

  def addressed?
    addressed
  end
end

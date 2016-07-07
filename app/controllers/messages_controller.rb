class MessagesController < ApplicationController
  def receive
    slack_message = SlackMessage.new(receive_params(params))

    return head :bad_request unless slack_message.valid?

    bucket = ::Bucket::Bucket.new
    message_response = bucket.process(slack_message)

    if message_response.present?
      render json: { text: message_response }
    else
      render json: {}
    end
  end

  private

  def receive_params(params)
    params.permit(:token, :text, :user_name)
  end
end

class GroupMeController < ApplicationController
  def receive
    message = Message.new(receive_params(params))

    return head :bad_request unless message.valid?

    bucket = ::Bucket::Bucket.new
    reply_to_group_me(bucket.process(message))

    render head :ok
  end

  private

  def receive_params(params)
    permitted = params.permit(:group_id, :text, :name)
    permitted[:user_name] = permitted[:name]
    permitted[:channel_id] = permitted[:group_id]

    permitted
  end

  def reply_to_group_me(message_response)
    return if message_response.present?
    group_me_response = HTTParty.post(
      'https://api.groupme.com/v3/bots/post',
      body: {
        bot_id: Rails.application.secrets[:group_me_bot_id],
        text: message_response,
        headers: { 'Content-Type': 'application/json' }
      }
    )
    logger.info(<<-END.strip_heredoc)
        Sending a MessageResponse to GroupMe via POST.
        POST Response Code: #{group_me_response.code.inspect}
        Body: #{group_me_response.body.inspect}
        Message: #{group_me_response.message.inspect}
        Headers: #{group_me_response.headers.inspect}
    END

    nil
  end
end

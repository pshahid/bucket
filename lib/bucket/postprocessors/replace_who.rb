module Bucket
  module Postprocessors
    class ReplaceWho
      def process(message_response)
        return if message_response.speaker.blank?

        message_response.text.gsub!('$who', message_response.speaker)

        nil
      end
    end
  end
end

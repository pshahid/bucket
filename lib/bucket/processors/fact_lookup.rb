module Bucket
  module Processors
    class FactLookup
      def process(message)
        fact = Fact.where(trigger: message.text).order('RANDOM()').first
        return unless fact.try(:result)

        MessageResponse.new(
          text: fact.result,
          trigger: message.text,
          verb: fact.verb,
          speaker: message.user_name,
        )
      end
    end
  end
end

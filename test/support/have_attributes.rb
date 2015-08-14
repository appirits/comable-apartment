module HaveAttributes
  class Matcher
    def initialize(attributes)
      @attributes = attributes.stringify_keys
      @differents = []
    end

    def matches?(subject)
      subject.each_pair do |key, value|
        actual_value = @attributes[key.to_s]
        @differents.push(key: key, actual: actual_value, expected: value) if actual_value != value
      end
      @differents.empty?
    end

    def failure_message_for_should
      @differents.map do |different|
        <<-EOS
#{different[:key]}:
    Expected: #{different[:expected]}
      Actual: #{different[:actual]}
        EOS
      end.join("\n")
    end

    def failure_message_for_should_not
      "expected not to match with #{@attributes}"
    end
  end

  def assert_have_attributes(attributes, subject)
    Matcher.new(attributes).matches? subject
  end

  ActiveSupport::TestCase.register_matcher Matcher, :have_attributes
end

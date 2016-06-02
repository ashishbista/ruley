module Ruley
  class Story

    # Default set of definitions
    mattr_accessor :definitions
    @@definitions = []

    attr_reader :rule, :action

    def with_rule(&block)
      @rule = block
    end

    def with_action(&block)
      @action = block
    end

  end
end

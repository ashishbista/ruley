module Ruley
  class Engine

    def self.setup(&block)
      engine = new
      engine.instance_eval(&block)
    end

    private
      def watch_definitions(story, &block)
        Ruley::Story.definitions.each do |definition|
          captures = definition.match(story).captures
          captures[0] = captures[0].titleize.constantize
          block.call(*captures)
        end
      end

      def story_for(model, &block)

        story = Ruley::Story.new
        story.instance_eval(&block)

        model.class_eval do

          @@stories ||= []
          @@stories << story

          def self.stories
            @@stories
          end

          after_update :check_for_rules

          def check_for_rules
            self.class.stories.each do |story|
              story.action.call(self) if story.rule.call(self)
            end
          end

        end
      end

  alias_method :add, :watch_definitions

  end
end

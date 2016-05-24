require 'spec_helper'

describe Ruley::Story do

  let(:rule_block) { Proc.new { |a| a.admin == true } }
  let(:action_block) { Proc.new { puts "Cool!" } }
  let(:story) { Ruley::Story.new }

  describe "#with_rule" do
    it "sets rule instance variable" do
      story.with_rule(&rule_block)
      expect(story.rule).to eq rule_block
    end
  end

  describe "#with_action" do
    it "sets action instance variable" do
      story.with_action(&action_block)
      expect(story.action).to eq action_block
    end
  end

end

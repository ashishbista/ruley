require 'spec_helper'

describe Ruley::Engine do
  describe ".setup" do

    let(:story_regex) { /(.*) has not (.*) in for (\d) (.*)/ }
    context "when called without a block" do
      it { expect{Ruley::Engine.setup}.to raise_error ArgumentError }
    end

    context "when called with required parameters" do

      subject(:engine) do
        Ruley::Engine.setup do
          add(/(.*) has not (.*) in for (\d) (.*)/) do |model, rule, n, days|
            story_for model do
              with_rule { |user| user.created_at < n.to_i.days.ago }
              with_action { puts "Please come back soon"  }
            end
          end
        end
      end

      let(:stories) { ["User has not logged in for 2 days"] }


      before do
        Ruley.config do |config|
          config.stories = stories
        end
      end

      context "when story class is not defined" do
        it { expect{subject}.to raise_error NameError }
      end

      context "when story class is defined" do

        before { require 'support/user' }

        it { expect{subject}.not_to raise_error }

        it "adds a new rule on the story class" do
          expect{subject}.to change{User.stories.count}.by(1)
        end

        it "adds check_for_rules callback on update" do
          callback =  User._update_callbacks.send(:chain).first
          expect(callback.instance_variable_get(:@key)).to eq :check_for_rules
          expect(callback.name).to eq :update
        end

      end

    end
  end


end

require 'spec_helper'

describe Ruley do
  describe ".config" do
    context "when called without block argument" do
      it "returns Ruley model" do
        expect(Ruley.config).to eq Ruley
      end
    end
    context "when called with a blcok" do
      it { expect{ |b| Ruley.config(&b)}.to yield_with_args(Ruley) }
    end
  end

  describe ".stories=" do
    let(:stories) { ["User has not logged in for 2 days"] }
    subject { Ruley.stories = stories }
    it "sets up story definitions" do
      expect(Ruley::Story).to receive(:definitions=).with(stories)
      subject
    end
    it "returns Ruley module" do
      expect(subject).to eq stories
    end
  end
end

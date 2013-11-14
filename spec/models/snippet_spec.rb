require 'spec_helper'

describe Snippet do
  it {should belong_to(:topic)}
  it {should belong_to(:user)}
  it {should belong_to(:source)}

  it {should validate_presence_of(:content)}
  it {should ensure_length_of(:content).is_at_most(255)}

  describe "#unlink!" do
    it "removes the topic_id from the snippet" do
      snippet = FactoryGirl.create(:topic_with_snippets).snippets.first
      snippet.unlink!
      expect(snippet.topic_id).to be(nil)
    end
  end
end
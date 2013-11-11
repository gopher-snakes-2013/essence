require 'spec_helper'

describe SnippetsController do

  let!(:topic){ FactoryGirl.create(:topic) }
  let!(:user){ FactoryGirl.build(:user) }

  before(:each) do
    sign_in_as(user)
  end

  context "#new" do
    it "returns a valid response when a new snippet is instantiated" do
      get :new
      response.status.should eq 200
    end
  end

  context "#create" do
    it "creates a new snippet with valid params" do
      expect {
        post :create, snippet: { topic_id: topic.id, content: 'this is content' }
      }.to change { Snippet.count }.by(1)
    end
  end

end
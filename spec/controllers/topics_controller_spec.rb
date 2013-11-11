require 'spec_helper'

describe TopicsController do
  let!(:user) { FactoryGirl.build(:user) }
  let!(:topic) { FactoryGirl.create(:topic_with_snippets ) }

  before(:each) do
    sign_in_as(user)
  end

  it "#index" do
    get :index
    response.status.should eq(200)
  end

  it "#new" do
    get :new
    response.status.should eq(200)
  end

  context "#create" do
    it "creates a new topic with valid params" do
      expect {
        post :create, topic: { user_id: topic.user_id, name: 'pascal' }
      }.to change { Topic.count }.by(1)
    end

    it "doesn't create a topic with invalid params" do
      expect {
        post :create, topic: { user_id: user.id }
      }.to_not change { Topic.count }
    end
  end

  context "#delete" do
    it "deletes a topic" do
      expect {
        delete :destroy, id: topic.id
      }.to change { Topic.count }.by(-1)
    end

    it "should not delete any snippets" do
      expect {
        delete :destroy, id: topic.id
      }.not_to change { Snippet.count }
    end

    it "should change its snippets' topic_id to 0" do
      snippet = topic.snippets.first
      delete :destroy, id: topic.id
      expect(Snippet.find(snippet.id).topic_id).to eq(0)
    end
  end

end
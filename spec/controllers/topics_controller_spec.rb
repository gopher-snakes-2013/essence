require 'spec_helper'

describe TopicsController do
  let!(:user) { FactoryGirl.build(:user)}

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
        post :create, topic: { user_id: 1, name: 'ruby' }
      }.to change { Topic.count }.by(1)
    end

    it "doesn't create a topic with invalid params" do
      expect {
        post :create, topic: { user_id: 1 }
      }.to_not change { Topic.count }
    end
  end
end
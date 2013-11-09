require 'spec_helper'

describe TopicsController do

  let!(:user) { FactoryGirl.create(:user) }

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
    xit "creates a new topic with valid params" do

    end

    xit "doesn't create a topic with invalid params" do

    end

    xit "doesn't create repeated topics (topics must be unique)" do

    end

  end
end
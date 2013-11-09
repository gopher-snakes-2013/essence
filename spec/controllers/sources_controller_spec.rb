require "spec_helper"

describe SourcesController do

  let!(:user) {FactoryGirl.build(:user)}

  before(:each) do
    sign_in_as(user)
  end

  context "#show" do
    it "should display a valid page" do
      get :show, id:1
      response.status.should eq(200)
    end
  end
end

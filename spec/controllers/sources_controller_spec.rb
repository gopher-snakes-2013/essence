require "spec_helper"
include SourceHelper

describe SourcesController do

  let!(:user) {FactoryGirl.create(:user)}

  before(:each) do
    sign_in_as(user)
  end

  context "#show" do
    it "should display a valid page" do
      create_sample_source
      get :show, id:1
      response.status.should eq(200)
    end
  end
end

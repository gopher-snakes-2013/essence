require 'spec_helper'

describe SnippetsController do
  
  let!(:user){ FactoryGirl.build(:user) }

  before(:each) do
    sign_in_as(user)
  end

  it "#new" do
    get :new
    response.status.should eq 200
  end

  it "creates a new snippet with valid params" do
    expect {
      post :create, snippet: { content: 'this is content' }
    }.to change { Snippet.count }.by(1)
  end

end
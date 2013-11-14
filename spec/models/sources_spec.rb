require 'spec_helper'

describe Source do
  it { should have_many(:snippets) }
  it { should validate_uniqueness_of(:url).scoped_to(:user_id) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:title) }

  it "should accept a valid url" do
    valid = Source.new
    valid.url = "http://www.google.com"
    valid.title = "google"
    valid.save
    valid.should be_valid
  end

  it "should not accept an invalid url" do
    valid = Source.new
    valid.url = "htxp://www.google.com"
    valid.title = "google"
    valid.save
    valid.should_not be_valid
  end
end
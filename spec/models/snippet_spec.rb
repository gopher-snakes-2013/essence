require 'spec_helper'

describe Snippet do
  it {should belong_to(:topic)}
  it {should validate_presence_of(:content)}
end
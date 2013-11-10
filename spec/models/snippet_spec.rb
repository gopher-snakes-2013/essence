require 'spec_helper'

describe Snippet do
  it {should belong_to(:topic)}
  it {should validate_presence_of(:content)}
  it {should ensure_length_of(:content).is_at_most(255)}
end
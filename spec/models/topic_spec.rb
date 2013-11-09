require 'spec_helper'

describe Topic do
  it { should belong_to(:user) }
  xit { should validate_presence_of(:name) }
end
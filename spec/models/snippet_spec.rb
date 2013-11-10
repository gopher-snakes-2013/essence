require 'spec_helper'

describe Snippet do
  it {should belong_to(:topic)}
end
require 'spec_helper'

describe Source do
  it { should validate_uniqueness_of(:url).scoped_to(:user_id) }
end
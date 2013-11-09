require 'spec_helper'

describe User do
  it { should have_many(:topics) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should_not allow_mass_assignment_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }
end
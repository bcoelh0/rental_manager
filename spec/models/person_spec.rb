require 'spec_helper'

describe Person do
  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:email) }
  it { should respond_to(:owner?) }
  it { should respond_to(:user) }

  it { should belong_to(:user) }
  it { should have_many(:rentals) }
  it { should have_many(:houses) }

  it { should validate_presence_of(:user) }
end

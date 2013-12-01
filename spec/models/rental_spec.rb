require 'spec_helper'

describe Rental do

  it { should respond_to(:house) }
  it { should respond_to(:client) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:notes) }
  it { should respond_to(:user) }

  it { should belong_to(:client) }
  it { should belong_to(:house) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:client) }
  it { should validate_presence_of(:house) }
  it { should validate_presence_of(:user) }

  it "other validations" do
    pending "other validations"
  end

end

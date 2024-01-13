require 'rails_helper'
RSpec.describe User, type: :model do
  it "is valid with a name" do
    user = User.new(name: "John Doe")
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: "")
    expect(user).to_not be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end
end
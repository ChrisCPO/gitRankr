require "rails_helper"

RSpec.describe User, type: :model do
  describe "#member?" do
    it "is user a member of the group" do
      group = create(:group)
      user = create(:user)

      expect(user.member?(group)).to eq false
    end
  end
end

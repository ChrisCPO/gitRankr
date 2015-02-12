require "rails_helper"

RSpec.describe User, type: :model do
  describe "#member?" do
    it "is user a member of the group" do
      group = create(:group)
      user = create(:user)

      expect(user.member?(group)).to eq false
    end
  end

  describe "#admin_of_group?" do
    it "user is admin of a group" do
      group = create(:group)
      user = create(:user)

      group.add_user(user)
      membership = Membership.where(user: user, group: group).first
      membership.make_admin

      expect(user.admin_of_group?(group)).to eq true
    end
  end
end

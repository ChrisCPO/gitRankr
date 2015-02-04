require "rails_helper"

RSpec.describe Group, type: :model do
  describe "#add_user" do
    it "groups can add users" do
      group = create(:group)
      user = create(:user)

      group.add_user(user)

      expect(group.users).to include user
    end
  end
  describe "#remove_user" do
    it "groups can remove users" do
      group = create(:group)
      user = create(:user)

      group.users << user
      group.remove_member(user)

      expect(group.users).not_to include user
    end
  end
end

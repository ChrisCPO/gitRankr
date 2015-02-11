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

  describe "#messages_desc" do
    it "displays messages in desc order" do
      group = create(:group)
      message_1 = create(:message)
      sleep(1)
      message_2 = create(:message)
      group.messages << message_2
      group.messages << message_1
      messages = [message_1, message_2]

      10.times do
        expect(group.messages_desc).to eq messages
      end
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

  describe "#non_admin_users" do
    it "lists non admin members" do
      group = create(:group)
      user_one = create(:user)
      user_two = create(:user)

      group.users << user_one
      group.memberships[0].admin = true
      group.users << user_two

      expect(group.non_admin_users).not_to include user_one
    end
  end
end

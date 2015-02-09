require "rails_helper"

RSpec.describe Membership, type: :model do
  describe "#make_admin" do
    it "user/membership becomes admin status" do
      membership = create(:membership)

      membership.make_admin

      expect(membership.admin).to eq true
    end
  end
end

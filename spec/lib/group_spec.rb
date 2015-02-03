require "rails_helper"

describe Group do
  describe "#create" do
    it "group should have a name" do
      group = create(:group)

      expect(group.name).to eq "sauce"
    end
  end
end

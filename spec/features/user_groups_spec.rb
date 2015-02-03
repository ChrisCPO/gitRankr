require "rails_helper"

feature "Group" do
  scenario "user can create a group" do
    user = create(:user)
    group_name = "scotty"

    sign_in(user)
    visit dashboard_path

    click_link "Create Group"
    fill_in "Name", with: group_name
    click_button "Create"

    expect(page).to have_text(group_name)
  end
end

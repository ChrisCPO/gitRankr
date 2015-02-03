require "rails_helper"

feature "Group" do
  scenario "user can create a group" do
    user = create(:user)
    group_name = "scotty"
    group_description = "Beam me up"

    sign_in(user)
    visit dashboard_path
    click_link "Create Group"
    fill_in "Name", with: group_name
    fill_in "Description", with: group_description
    click_button "Create"

    expect(page).to have_text(group_name)
    expect(page).to have_text(group_description)
  end

  scenario "user can view groups they are members of" do
    user = create(:user)
    group = create(:group)

    sign_in(user)
    group.add_user(user)
    visit dashboard_path
    click_link "sauce"

    expect(page).to have_text(group.name)
  end
end

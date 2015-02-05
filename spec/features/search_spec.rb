
require "rails_helper"

feature "Search" do
  scenario "user can search for groups" do
    user = create(:user)
    group = create(:group)

    sign_in(user)
    visit dashboard_path
    fill_in "search", with: group.name
    click_button "Search"

    expect(page).to have_text(group.name)
  end
end

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

  scenario "user can leave a group they are part of" do
    user = create(:user)
    group = create(:group)

    sign_in(user)
    group.users << user
    visit dashboard_path
    click_link group.name
    click_link "Leave Group"

    expect(page).to have_text("Join Group")
    expect(user.member?(group)).to eq false

    group.remove_member(user)
    expect(group.users.length).to eq 0
    expect(group.users).not_to include user
  end

  scenario "user can join a group" do
    user = create(:user)
    group = create(:group)

    sign_in(user)
    visit group_path(group)
    click_link "Join Group"

    expect(page).to have_text("Leave Group")
    expect(group.users).to include user
  end

  scenario "user can see all members of that group" do
    user = create(:user)
    group = create(:group)

    sign_in(user)
    group.users << user
    visit group_path(group)

    expect(page).to have_text(user.email)
  end
end

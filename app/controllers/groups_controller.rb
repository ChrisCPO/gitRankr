class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def show
    @group = find_group
  end

  def create
    @group = Group.new(group_params)
    @group.add_user(current_user)

    if @group.save
      membership = @group.memberships.take
      membership.make_admin
      redirect_to @group
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def find_group
    Group.find(params[:id])
  end
end

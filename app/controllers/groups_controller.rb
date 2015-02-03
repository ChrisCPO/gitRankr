class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def show
  end

  def create
    @group = Group.new(group_params)
    @group.add_user(current_user)

    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end

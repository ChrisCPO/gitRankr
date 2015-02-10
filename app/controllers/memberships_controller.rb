class MembershipsController < ApplicationController
  before_action :user_belongs_to_group, only: [:destroy]
  def new
  end

  def create
    @group = find_group
    @group.add_user(current_user)

    redirect_to @group
  end

  def destroy
    @group = Group.find(params[:group_id])
    @group.remove_member(current_user)

    redirect_to @group
  end

  private

  def find_group
    @group ||= Group.find(params[:group_id])
  end

  def user_belongs_to_group
    unless current_user.member?(find_group)
      redirect_to :back
    end
  end
end

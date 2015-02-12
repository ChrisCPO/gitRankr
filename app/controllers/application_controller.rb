class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_is_admin_of_group
    membership = Membership.where(user: current_user, group: find_group).first
    membership.admin?
  end

  private

  def find_group
    Group.find(params[:group_id])
  end
end

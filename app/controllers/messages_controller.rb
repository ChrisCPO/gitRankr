class MessagesController < ApplicationController
  def new
    group = find_group
    @message = group.messages.new
  end

  def create
    group = find_group
    @message = group.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to group_path(group)
    else
      render new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def find_group
    Group.find(params[:group_id])
  end
end

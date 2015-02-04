class Group < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :group_memberships
  has_many :users, through: :group_memberships

  def add_user(new_user)
    users << new_user
  end

  def remove_member(member)
    users.destroy(member)
  end
end

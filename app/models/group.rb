class Group < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :memberships
  has_many :users, through: :memberships

  has_many :admin_memberships, -> { where admin: true },
                                     class_name: "Membership"
  has_many :admins, through: :admin_memberships, source: "user"

  def add_user(new_user)
    users << new_user
  end

  def remove_member(member)
    users.destroy(member)
  end

  def non_admin_users
    admins - users
  end
end

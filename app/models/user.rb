class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :messages

  has_many :memberships
  has_many :groups, through: :memberships

  def member?(group)
    group.users.include?(self)
  end

  def admin_of_group?(group)
    membership = find_membership(group)
    membership.admin?
  end

  def group_membership(group)
    find_membership(group)
  end

  private

  def find_membership(group)
    Membership.where(user: self, group: group).first
  end
end

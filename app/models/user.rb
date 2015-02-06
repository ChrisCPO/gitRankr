class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  def member?(group)
    group.users.include?(self)
  end
end

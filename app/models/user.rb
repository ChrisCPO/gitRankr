class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :memberships
  has_many :groups, through: :memberships

  def member?(group)
    group.users.include?(self)
  end
end

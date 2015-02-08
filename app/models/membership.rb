class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  def make_admin
    self.admin = true
    save
  end
end

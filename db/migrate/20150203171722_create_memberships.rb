class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user
      t.references :group
      t.boolean :admin, default: false
      t.timestamps null: false
    end
  end
end

class RemoveAdminFromMember < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :admin
  end
end

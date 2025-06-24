class ChangeCommenterNameToCommenter < ActiveRecord::Migration[7.2]
  def change
    rename_column :comments, :commenter_name, :commenter
  end
end

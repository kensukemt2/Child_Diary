class RenameCommentColumnToContent < ActiveRecord::Migration[5.1]
  def change
    rename_column :bord_comments, :comment, :content
  end
end

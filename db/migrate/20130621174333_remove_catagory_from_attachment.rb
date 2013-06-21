class RemoveCatagoryFromAttachment < ActiveRecord::Migration
  def up
    remove_column :attachments, :category
  end

  def down
    add_column :attachments, :category, :string
  end
end

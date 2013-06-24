class AddDownloadTimeToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :download_time, :integer, :default => 0
  end
end

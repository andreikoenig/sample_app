class RenameRestDigestToResetDigest < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :rest_digest, :reset_digest
  end
end

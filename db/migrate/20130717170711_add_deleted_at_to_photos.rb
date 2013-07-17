class AddDeletedAtToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :deleted_at, :timestamp, default: nil
  end
end

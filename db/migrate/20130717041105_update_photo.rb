class UpdatePhoto < ActiveRecord::Migration
  def up
    add_column :photos, :name, :string
    add_column :photos, :description, :string
  end

  def down
    drop_column :photos, :name, :string
    drop_column :photos, :description, :string
  end
end

class AddColumnsToVideo < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :thumbnail_width, :integer
    add_column :videos, :thumbnail_height, :integer
  end
end

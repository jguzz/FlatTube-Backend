class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :videoURL
      t.string :description
      t.string :channelTitle
      t.integer :views
      t.integer :commentCount
      t.datetime :uploadDate
      t.string :thumbnailURL

      t.timestamps
    end
  end
end

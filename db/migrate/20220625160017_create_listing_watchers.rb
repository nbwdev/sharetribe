class CreateListingWatchers < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_watchers do |t|
      t.integer  :listing_id
      t.string  :watcher_id

      t.timestamps
    end

    add_index :listing_watchers, [ :listing_id, :watcher_id ], :unique => true
    add_index :listing_watchers, :listing_id
    add_index :listing_watchers, :watcher_id
  end
end

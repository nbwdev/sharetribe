# == Schema Information
#
# Table name: listing_watchers
#
#  id               :integer          not null, primary key
#  listing_id       :string(255)      not null
#  watcher_id       :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_listing_watchers_on_listing_id                 (listing_id)
#  index_listing_watchers_on_watcher_id                 (watcher_id)
#  index_listing_watchers_on_listing_id_and_watcher_id  (listing_id,watcher_id) UNIQUE
#

class ListingWatcher < ApplicationRecord

  belongs_to :listing
  belongs_to :watcher, :class_name => "Person"

  validates :listing_id,
            :presence => true
  validates :watcher_id,
            :presence => true
  
  validates :listing, :uniqueness => { :scope => :watcher }

end

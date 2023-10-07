# == Schema Information
#
# Table name: newsflash_hero_images
#
#  id                                :bigint           not null, primary key
#  community_id                      :integer
#  newsflash_hero_image_file_name    :string(255)
#  newsflash_hero_image_content_type :string(255)
#  newsflash_hero_image_file_size    :integer
#  newsflash_hero_image_updated_at   :datetime
#  newsflash_hero_image_processing   :boolean
#  alt_text                          :string(255)
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
# Indexes
#
#  index_newsflash_hero_images_on_community_id  (community_id)
#

class NewsflashHeroImage < ApplicationRecord
  belongs_to :community

  has_attached_file :newsflash_hero_image,
  :styles => {
    :original => "800x533>",
    :thumbnail => "300x150#"
  },
  :keep_old_files => true

  validates_attachment_content_type :newsflash_hero_image,
                                    :content_type => IMAGE_CONTENT_TYPE

  validates_attachment_size :newsflash_hero_image, :less_than => 100.kilobytes         

  process_in_background :newsflash_hero_image, priority: 1
end

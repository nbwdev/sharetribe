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

require 'rails_helper'

RSpec.describe NewsflashHeroImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

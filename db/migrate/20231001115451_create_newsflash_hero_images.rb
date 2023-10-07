class CreateNewsflashHeroImages < ActiveRecord::Migration[5.2]
  def change
    create_table :newsflash_hero_images do |t|
      t.references :community, foreign_key: true, type: :integer

      # Paperclip standard fields
      t.string :newsflash_hero_image_file_name
      t.string :newsflash_hero_image_content_type
      t.integer :newsflash_hero_image_file_size
      t.datetime :newsflash_hero_image_updated_at
      t.boolean :newsflash_hero_image_processing

      # Custom fields for this model
      t.string :alt_text

      t.timestamps
    end
  end
end

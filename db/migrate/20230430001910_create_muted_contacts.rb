class CreateMutedContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :muted_contacts do |t|
      t.string :email_address, null: false, index: { unique: true }
      t.integer :emails_blocked, null: false, default: 0

      t.timestamps
    end
  end
end

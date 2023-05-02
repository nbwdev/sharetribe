# == Schema Information
#
# Table name: muted_contacts
#
#  id             :bigint           not null, primary key
#  email_address  :string(255)      not null
#  emails_blocked :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_muted_contacts_on_email_address  (email_address) UNIQUE
#

class MutedContact < ApplicationRecord

    validates :email_address,
    :presence => true

end

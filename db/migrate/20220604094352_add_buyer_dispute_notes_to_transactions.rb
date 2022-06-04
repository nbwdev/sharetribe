class AddBuyerDisputeNotesToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :buyer_dispute_notes, :text
  end
end

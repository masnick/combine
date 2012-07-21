class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :client_id
      t.float :amount
      t.decimal :fee
      t.string :token
      t.boolean :paid

      t.timestamps
    end
  end
end

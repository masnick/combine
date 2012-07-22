class CreateInvoiceViews < ActiveRecord::Migration
  def change
    create_table :invoice_views do |t|
      t.integer :invoice_id
      t.string :ip
      t.string :location

      t.timestamps
    end
  end
end

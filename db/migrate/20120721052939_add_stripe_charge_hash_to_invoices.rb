class AddStripeChargeHashToInvoices < ActiveRecord::Migration
  def up
    add_column :invoices, :stripe_charge_hash, :string
    remove_column :invoices, :paid
  end
  def down
    remove_column :invoices, :stripe_charge_hash
    add_column :invoices, :paid, :boolean
  end
end

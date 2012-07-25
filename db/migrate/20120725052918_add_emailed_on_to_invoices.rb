class AddEmailedOnToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :emailed_on, :datetime
  end
end

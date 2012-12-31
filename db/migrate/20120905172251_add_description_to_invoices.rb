class AddDescriptionToInvoices < ActiveRecord::Migration
  def change
    change_column :invoices, :description, :string
  end
end

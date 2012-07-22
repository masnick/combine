ActiveAdmin.register Invoice do
  form do |f|
    f.inputs "Invoice" do
      f.input :client
      f.input :number, :label => "Invoice number"
      f.input :amount, :label => "Amount in $, e.g. 1283.53"
      f.input :fee, :label => "Convenience fee as decimial, e.g. 0.01 for 1%"
      f.input :stripe_charge_hash, :label => "Stripe charge token (leave blank for unpaid)"
    end
    f.buttons
  end
end

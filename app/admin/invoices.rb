ActiveAdmin.register Invoice do
  form do |f|
    f.inputs "Invoice" do
      f.input :client
      f.input :number, :label => "Invoice number", :as => :string
      f.input :amount, :label => "Amount in $, e.g. 1283.53", :as => :string
      f.input :fee, :label => "Convenience fee as decimial, e.g. 0.01 for 1%", :input_html => {value: STRIPE_FEE / 2}
      f.input :due_date, :label => "Due date", :as => :datepicker, :input_html => {value: (Time.now + PAYMENT_TIME).strftime('%Y-%m-%d')}
      f.input :stripe_charge_hash, :label => "Stripe charge token (leave blank for unpaid)"
    end
    f.buttons
  end
end

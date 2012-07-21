class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :stripe_customer_token

      t.timestamps
    end
  end
end

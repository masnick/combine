class Client < ActiveRecord::Base
  attr_accessible :email, :name, :stripe_customer_token
end

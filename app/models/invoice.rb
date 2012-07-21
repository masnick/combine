class Invoice < ActiveRecord::Base
  attr_accessible :amount, :client_id, :fee, :paid, :token
end

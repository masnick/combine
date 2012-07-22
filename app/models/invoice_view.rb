class InvoiceView < ActiveRecord::Base
  attr_accessible :invoice_id, :ip, :location
  belongs_to :invoice
end

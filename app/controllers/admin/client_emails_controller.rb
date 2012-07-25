class Admin::ClientEmailsController < ApplicationController
  before_filter :require_admin
  def invoice
    @invoice = Invoice.find(params[:id])
    ClientMailer.new_invoice_email(@invoice).deliver
    @invoice.emailed_on = Time.now
    @invoice.save!

    redirect_to admin_dashboard_path, :notice => "Email sent."
  end
end

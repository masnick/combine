class InvoicesController < ApplicationController
  before_filter :load_invoice
  before_filter :require_unpaid, :only => [:show, :pay]
  before_filter :require_paid, :only => :paid

  def show
    unless current_admin_user
      g = Geokit::Geocoders::GeoPluginGeocoder.geocode(request.remote_ip)
      i = InvoiceView.new({invoice_id: @invoice.id, ip: request.remote_ip, location: "#{g.city}, #{g.country}"})
      i.save
    end
  end

  def pay
    if @invoice.pay(params[:invoice][:stripe_card_token])
      redirect_to :action => :paid, :id => @invoice.token
    else
      render :show
    end
  end

  def paid
  end

  private
  def load_invoice
    @invoice = Invoice.find_by_token(params[:id], :include => :client)

    unless @invoice
      redirect_to root_url, :notice => 'Invoice not found.'
      return
    end
  end

  def require_unpaid
    redirect_to :action => :paid, :id => @invoice.token if @invoice.paid?
  end

  def require_paid
    redirect_to :action => :show, :id => @invoice.token unless @invoice.paid?
  end
end

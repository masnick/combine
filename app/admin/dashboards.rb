ActiveAdmin::Dashboards.build do

  section "Recent Invoice Views" do
    div do
      render 'recent_invoice_views'
    end
  end

  section "Open Invoices" do
    table_for Invoice.where(:stripe_charge_hash => nil || '') do
      column :number do |invoice|
        link_to("##{invoice.number}", admin_invoice_path(invoice))
      end
      column :amount do |invoice|
        number_to_currency invoice.amount
      end
      column :created_at
      column :due_date
      column 'Client link' do |invoice|
        link_to("Link", "/invoices/#{invoice.token}")
      end
      column 'Email to client' do |invoice|
        link_to "Email", invoice_admin_client_email_path(invoice), :confirm => "Are you sure?", :method => :post
      end
      column "Client emailed on", :emailed_on
    end
    div do
      link_to "Create new invoice", new_admin_invoice_path
    end
  end

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.

  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end

  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end

  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end

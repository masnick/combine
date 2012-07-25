class ClientMailer < ActionMailer::Base
  include ActionView::Helpers::DateHelper
  default from: SUPPORT_EMAIL

  def new_invoice_email(invoice)
    @invoice = invoice
    @url = "https://"+APP_URL + '/invoices/' + @invoice.token

    # Get the due date in words for the body of the email
    if @invoice.due_date_as_date
      diff = @invoice.due_date_as_date - Time.now
      if diff > 1.day
        @due_date_in_words = 'due in ' + distance_of_time_in_words_to_now(@invoice.due_date_as_date) + " (#{@invoice.due_date_as_date.strftime('%b %e, %Y')})"
        @due_date_for_subject = "Due #{@invoice.due_date_as_date.strftime('%b %e, %Y')} - "
      elsif diff > 1.day * -1
        @due_date_in_words = "due today (#{@invoice.due_date_as_date.strftime('%b %e, %Y')})"
        @due_date_for_subject = "Due today - "
      else
        @due_date_in_words = "OVERDUE (it was due #{@invoice.due_date_as_date.strftime('%b %e, %Y')})"
        @due_date_for_subject = "OVERDUE - "
      end
    else
      @due_date_in_words = "due at your convenience"
      @due_date_for_subject = ''
    end


    mail(:to => @invoice.client.email, :cc => SUPPORT_EMAIL, :subject => "#{@due_date_for_subject}Paying invoice ##{@invoice.number} online")
  end
end

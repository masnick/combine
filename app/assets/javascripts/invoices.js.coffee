# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.chosen').chosen()

  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  invoice.setupForm()

invoice =
  setupForm: ->
    $('.edit_invoice').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        invoice.processCard()
        false
      else
        true

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      exp_month: $('#card_month').val()
      exp_year: $('#card_year').val()
      # address_zip: $('#address_zip').val()
      # name: $('#name').val()
    Stripe.createToken(card, invoice.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#invoice_stripe_card_token').val(response.id)
      $('.edit_invoice')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)
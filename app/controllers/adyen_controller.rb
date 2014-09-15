class AdyenController < ActionController::Base
  #before_filter :adyen_authenticate

  # POST https://example.com/adyen/notify
  def notify
    #@notification = AdyenNotification.log(params)
    #if @notification.successful_authorisation?
    #  @purchase = Purchase.find(@notification.merchant_reference)
    #
    #  # Add card info from Adyen
    #  @purchase.payment_method = params[:paymentMethod]
    #
    #  # Reason string example: 20630:1111:12/2012
    #  # Format: "AUTHORISATION CODE FROM ACQUIRER: LAST 4 DIGITS OF CARD : EXPIRY DATE
    #  # Extract the last four digits of the card number
    #  last_digits_match = params[:reason].match(/.*?:(\d+).*/)
    #  @purchase.last_digits = last_digits_match[1] if last_digits_match.present?
    #  @purchase.save!
    #  
    #  @purchase.complete!
    #end
    #rescue ActiveRecord::RecordInvalid => e
    #  # Validation failed, because of the duplicate check.
    #  # So ignore this notification, it is already stored and handled.
    #ensure
    #  # Always return that we have accepted the notification
    #  render :text => '[accepted]'
  end
  #protected 
  #
  ## Enable HTTP basic authentication
  #def adyen_authenticate
  #  authenticate_or_request_with_http_basic do |username, password|
  #    username == 'koblo' && password == 'moo1ubi0ooT3Zo'
  #  end
  #  # This line is necessary in order to keep Devise/Warden happy
  #  warden.custom_failure! if performed?
  #end
end


class SignInController < ApplicationController
  layout nil

  def successful_sign_in
    flash.keep
  end
end

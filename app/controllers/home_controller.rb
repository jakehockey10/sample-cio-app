class HomeController < ApplicationController
require 'ContextIO'

  def index
    if user_signed_in?
      cio = ContextIO.new(ENV['contextio_key'], ENV['contextio_secret'])
      user_email = current_user.email
      @account = cio.accounts.where(email: user_email).first
    end
  end
  
end

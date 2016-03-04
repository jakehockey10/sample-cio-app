class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def contextio_init
    #Make sure your ENV names match these below!
    @cio = ContextIO.new(ENV['contextio_key'], ENV['contextio_secret'])
  end

  def get_cio_user
    contextio_init
    user_email = current_user.email.to_s
    @account = @cio.accounts.where(email: user_email).first
  end

end

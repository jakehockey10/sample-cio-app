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

  def check_for_connect_token
    #check for a connect token present in params after browser redirect, save account id to database
    if params[:contextio_token].present?
      contextio_init
      token_response = @cio.connect_tokens[params[:contextio_token]]
      account_id = token_response.account.id
      user = User.where(email: current_user.email).first
      user.account_id = account_id
      user.save!
    end
  end

end

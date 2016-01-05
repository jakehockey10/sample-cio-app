class MessagesController < ApplicationController

before_filter :cio_init

  def show
    id = params[:id]
    @message = @account.messages[id]
  end

  private

    def cio_init
      cio = ContextIO.new(ENV['contextio_key'], ENV['contextio_secret'])
      user_email = current_user.email.to_s
      @account = cio.accounts.where(email: user_email).first
    end

end

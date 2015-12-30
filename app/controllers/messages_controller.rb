class MessagesController < ApplicationController

before_filter :start_cio

  def show
    id = params[:id]
    @message = @account.messages[id]
  end

  private

    def start_cio
      cio = ContextIO.new(ENV['contextio_key'], ENV['contextio_secret'])
      user_email = current_user.email.to_s
      @account = cio.accounts.where(email: user_email).first
    end

end

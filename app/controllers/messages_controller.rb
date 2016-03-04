class MessagesController < ApplicationController

  def show
    #view get_cio_user in ApplicationController
    get_cio_user
    id = params[:id]
    @message = @account.messages[id]
  end
end

class HomeController < ApplicationController
require 'ContextIO'

  def index
    if user_signed_in?
      #View get_cio_user in ApplicationController to see methods below
      get_cio_user
      check_for_connect_token
    end
  end

end

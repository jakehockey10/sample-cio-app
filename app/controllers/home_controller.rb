class HomeController < ApplicationController
require 'ContextIO'

  def index
    if user_signed_in?
      #view get_cio_user in ApplicationController
      get_cio_user
    end
  end

end

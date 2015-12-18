class HomeController < ApplicationController
require 'ContextIO'
  def index
    cio = ContextIO.new(ENV['contextio_key'], ENV['contextio_secret'])
    user_id = '563bab34e63723f2388b4567'
    @account = cio.accounts[user_id]
  end
end

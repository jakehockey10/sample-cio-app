class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    resource.save
    sign_in(resource)
    #View contextio_init in ApplicationController
    contextio_init
    @user = resource
    @user_email = @user.email.to_s
    new_account = @cio.connect_tokens.create('http://localhost:3000', {email: @user_email})
    #Notice we're using the skip_oauth_splash=1 param to skip ContextIO login screens
    redirect_url = new_account.browser_redirect_url + "&skip_oauth_splash=1"
    redirect_to redirect_url
  end

end

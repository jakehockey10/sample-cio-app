class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    resource.save
    sign_in(resource)
    #view contextio_init in ApplicationController
    contextio_init
    @user = resource
    @user_email = @user.email.to_s
    new_account = @cio.api.request(
      :post,
      'https://api.context.io/2.0/connect_tokens',
      {callback_url: 'http://localhost:3000/users/sign_in', email: @user_email}
    )
    redirect_url = new_account["browser_redirect_url"] + "&skip_oauth_splash=1"
    redirect_to redirect_url
  end

end

class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    resource.save
    sign_in(resource)
    #Make sure your ENV variables are "contextio_key" and "contextio_secret" or rename the ones below to match yours
    cio = ContextIO.new(ENV['contextio_key'], ENV['contextio_secret'])
    @user = resource
    @user_email = @user.email.to_s
    new_account = cio.api.request(
      :post,
      'https://api.context.io/2.0/connect_tokens',
      {callback_url: 'http://localhost:3000/users/sign_in', email: @user_email}
    )
    redirect_to new_account["browser_redirect_url"]
  end

end

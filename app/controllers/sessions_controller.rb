class SessionsController < ApplicationController
  def new

  end

  def create
    render 'new'
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーをサインインさせ、ユーザーページ (show) にリダイレクトする。
    else
      flash.now[:error] = 'Invalid email/password combination' # 誤りあり!
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

end
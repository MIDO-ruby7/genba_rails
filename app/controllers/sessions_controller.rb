class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    #送られてきたメールアドレスでユーザーを検索

    if user&.authenticate(session_params[:password])
      #ユーザーが見つかった場合、送られてきたパスワードによる認証をauthenticateメソッドを使って行う
        session[:user_id] = user.id #成功した場合にセッションにuser_idを格納
        redirect_to root_url, notice: 'ログインしました'
    else
      render :new
    end
  end

  def destroy
    reset_session
  redirect_to root_url, notice: 'ログアウトしました'
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end

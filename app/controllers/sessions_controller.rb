# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # sign_in succeed  sign_in は自分で定義したメソッド
      sign_in user
      redirect_to user
    else
      # sign_in failed
      flash.now[:error] = "メールアドレスまたはパスワードが違います"
      render 'new'
    end
  end

  def destroy
  end
end

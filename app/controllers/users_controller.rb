# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save # ユーザー登録に成功したとき
      # サインインさせる
      sign_in @user
      # ユーザ登録に成功した時のメッセージ
      flash[:success] = "ユーザ登録に成功しました。Welcome to Renga World!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

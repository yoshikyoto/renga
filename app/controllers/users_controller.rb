# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :already_signed_in, only: [:new, :create]

  def index
    # @users = User.all
    # pagenate のための新しいメソッドに置き換え
    @users = User.paginate(page: params[:page])
  end

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
  
  def edit
    # @user = User.find(params[:id])
    # before_action の correct_user に移動
  end

  def update
    # @user = User.find(params[:id])
    # before_action の correct_user に移動
    if @user.update_attributes(user_params)
      # 更新に成功したとき
      flash[:success] = "プロフィールの変更が完了しました"
      redirect_to @user
    else
      # 更新に失敗したとき
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # ログインしていないときにログインページに飛ばしてメッセージを表示する
    def signed_in_user
      unless signed_in?
        store_location # app/helpers/sessions_helper.rb に実装してある関数
        redirect_to signin_url, notice: "ログインしてください"
        # flash[:notice] = "ログインしてください" してリダイレクトするのと同じ
      end
    end

    # すでにサインインしてたら　new とか create は不要。
    def already_signed_in
      if signed_in?
        redirect_to current_user
      end
    end

    # @user と current_user が一致しているかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
      # current_user? は app/helpers/sessions_helper.rb のメソッド
    end

    # 管理者かどうかを確認する
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end

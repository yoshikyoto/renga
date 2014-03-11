# -*- coding: utf-8 -*-
module SessionsHelper
  def sign_in(user)
    # トークンを生成
    remember_token = User.new_remember_token
    # cookie に登録
    cookies.permanent[:remember_token] = remember_token
    # 暗号化したトークンをデータベースに保持
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user # current_user= が呼ばれる
  end

  def current_user=(user)
    @current_user = user
  end

  # 8.22 remenber_token で現在のユーザを検索する
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    # @current_user が未定義の時だけ、トークンを設定
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  # サインインしてるかどうか確認するメソッド
  def signed_in?
    !current_user.nil?
  end

  # サインアウトする関数
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  # フレンドリーフォワーディング関係
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
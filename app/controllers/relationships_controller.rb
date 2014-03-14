# -*- coding: utf-8 -*-
class RelationshipsController < ApplicationController
  before_action :signed_in_user

  # Ajax 対応版。 view/users/_follow_form.html.erb と一緒に見るといい
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    # リクエストの種類に応じて、どれかが実行される。
    # html なら　redirect_to, js(Ajax)ならなにもしない チュートリアル11.2.5
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end

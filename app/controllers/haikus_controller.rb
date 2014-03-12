# -*- coding: utf-8 -*-
class HaikusController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  # そのうち作りたい
  # def index
  # end
  
  def create
    @haiku = current_user.haikus.build(haiku_params)
    if @haiku.save
      # post に成功した場合
      flash[:success] = "五七五が投稿されました！"
      redirect_to root_url
    else
      # post に失敗した場合
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private
    def haiku_params
      params.require(:haiku).permit(:first_five, :middle_seven, :last_five)
    end
end

# -*- coding: utf-8 -*-
class HaikusController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

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
      # feed 表示でエラーが出ないように、とりあえず空の配列を渡す
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @haiku.destroy
    redirect_to root_url
  end

  private
    def haiku_params
      params.require(:haiku).permit(:first_five, :middle_seven, :last_five)
    end

    # 本人の俳句かどうか確認
    # find は見つからなかった時に例外を発生させる。 find_by は nil を返す
    def correct_user
      @haiku = current_user.haikus.find_by(id: params[:id])
      redirect_to root_url if @haiku.nil?
    end
end

# -*- coding: utf-8 -*-
class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @haiku = current_user.haikus.build
      # feed は　models/user.rb に定義されている関数
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def contact
  end
end

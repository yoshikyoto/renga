class StaticPagesController < ApplicationController
  def home
    @haiku = current_user.haikus.build if signed_in?
  end

  def help
  end

  def contact
  end
end

# -*- coding: utf-8 -*-
module ApplicationHelper

# ページの titile を作成するのつ使う関数
  def fullTitle(page_title)
    base_title = "Renga"
    if page_title.empty?
      base_title
    else
      "#{base_title} - #{page_title}"
    end
  end
end

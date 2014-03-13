# -*- coding: utf-8 -*-
class Haiku < ActiveRecord::Base
  belongs_to :user # 関係をもたせる
  default_scope -> { order('created_at DESC') }  # デフォルトを日付降順にする
  # これは Rails 3 までで、rails 4 では無名関数を使うらしい
  # -> { order('created_at DESC') } # それがこれ
  validates :user_id, presence: true
  validates :first_five, presence: true, length: { maximum: 6 }
  validates :middle_seven, presence:true, length: { maximum: 8 }
  validates :last_five, presence:true, length: { maximum: 6 }
end

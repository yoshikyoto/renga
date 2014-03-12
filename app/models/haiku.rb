# -*- coding: utf-8 -*-
class Haiku < ActiveRecord::Base
  belongs_to :user # 関係をもたせる
  dafault_scope -> { order('created_at DESC') }  # デフォルトを日付降順にする
  # rails 4 では無名関数を使うらしい？ 10章要確認
  # -> { order('created_at DESC') } みたいなラムダ関数らしい？
  validates :user_id, presence: true
  validates :first_five, presence:true length: { maximum: 6 }
  validates :middle_seven, presence:true length: { maximum: 8 }
  validates :last_five, presence:true length: { maximum: 6 }
end

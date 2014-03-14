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

  # フィード
  def self.from_users_followed_by(user)
    # 遅いコード
    # followed_user_ids = user.followed_user_ids
    # where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
    # user_id の使い回しをする
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
           user_id: user)
  end
end

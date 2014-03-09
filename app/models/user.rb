# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 20 }
  # name cant be blank
  # and length <= 20
  # name は一意でなくていい (同じ名前のユーザが存在してもいい)

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]*\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  # email cant be blank
  # and formati is xxxx@xxxx.xxx not xxxx@xxx
  # 大文字小文字も考慮して uniqueness
  
  before_save { self.email = email.downcase }
  # save 前に email をすべて小文字に
end

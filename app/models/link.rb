class Link < ApplicationRecord
  #tweetsテーブルから中間テーブルに対する関連付け
  has_many :link_tags, dependent: :destroy
  #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :link_tags, dependent: :destroy
end

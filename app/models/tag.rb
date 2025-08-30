class Tag < ApplicationRecord
 #Tagsテーブルから中間テーブルに対する関連付け
  has_many :link_tags, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :links, through: :link_tags, dependent: :destroy
end

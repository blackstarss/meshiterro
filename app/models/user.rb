class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  
  # has_manyの後には、1:Nの関係になるモデル名を複数形で記述
  has_many :post_comments, dependent: :destroy
  # dependent: :destroyは、has_manyで使えるオプション   1:Nの関係において、「1」のデータが削除された場合、関連する「N」
  # この設定では、Userのデータが削除されたとき、そのUserが投稿したコメントデータも一緒に削除  
  
  has_many :favorites, dependent: :destroy
  attachment :profile_image
  # attachmentには、カラム名（profile_image_id）から_idを除いた名前（profile_image）を記述します

end

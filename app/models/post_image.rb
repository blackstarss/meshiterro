class PostImage < ApplicationRecord
  
   belongs_to :user
   
   attachment :image # ここを追加（_idは含めません）
   
   has_many :post_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   
   validates :shop_name, presence: true
  validates :image, presence: true
   

   def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
   end
   # favorited_by?メソッドを作成します。
   # このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます。
   # 存在していればtrue、存在していなければfalseを返すようにしています。
   
end

Rails.application.routes.draw do
  
  get 'users/show'
  root 'homes#top'
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
       resource :favorites, only: [:create, :destroy]
      # 単数にすると、そのコントローラのidがリクエストに含まれなくなります。
      # 今回、いいねの詳細ページは作成しません。
      # favoritesのshowページが不要で、idの受け渡しも必要ないので、resourceとなっています。
       
       
       resources :post_comments, only: [:create, :destroy]
  end
    
  # resourcesメソッドは、ルーティングを一括して自動生成してくれます。一方、onlyは、生成するルーティングを限定するオプションです。
  # 画像投稿には、「新規投稿」「一覧」「詳細機能」「削除」しか使わないため、不要なルーティングが実行されないようにonlyを設定します。
  
  # 親のresourcesで指定したコントローラ名に、子のresourcesで指定したコントローラ名が続くURLが生成されるのが確認できます。
  # このような親子関係を、「ネストする」と言います。
  
   resources :users, only: [:show, :edit, :update]

end

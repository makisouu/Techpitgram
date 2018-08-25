Rails.application.routes.draw do
	root 'posts#index'
  
  	root 'pages#home' #root（トップページ「/」）に訪れた際にpagesコントローラーのhomeアクションを実行
  
  	devise_for :users,
  		controllers: { registrations: 'registrations' } 

  	resources :users, only: %i(show)

  	resources :posts, only: %i(index new create show) do
  		resources :photos, only: %i(create) 
 	  end


 	  resources :posts, only: %i(index show create destroy) do
    	resources :photos, only: %i(create)
    	resources :likes, only: %i(create destroy), shallow: true # ここの行を追加する
    end

    resources :posts, only: %i(index show create) do
      resources :photos, only: %i(create)
      resources :likes, only: %i(create destroy), shallow: true
      resources :comments, only: %i(index create destroy), shallow: true # この行を追加する
    end
  

end

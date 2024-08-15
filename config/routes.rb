Rails.application.routes.draw do

  #重複して書くとバグの原因になる
  
  ##ブラウザから投稿2024/2/23変更 
  #get 'posts/create'  ##ここにアクセスすると行が生成される
  get 'posts/add'   ##ブラウザから投稿2024/2/23変更 
  ############post '/posts/create'  
  #get 'posts/:id',to:'posts#show'

  post 'posts/create'
  get 'posts/index'
  get 'posts/delete_all'
  post 'posts/delete'
  get 'posts/delete'
  get 'posts/delete_all'

  get 'posts/delete_index/:id' ,to:'posts#delete_index'
  get '/posts',to:'posts#index'
  get '/posts/show/:id',to:'posts#show'
  
  post 'configs/index'
  patch 'configs/update'
  post 'configs/update'
  get 'configs/update'
  get 'configs/index'
  get 'configs/show'
  post 'configs/show'
  get 'configs/index'
  get 'configs/create'
  get 'configs/show'
  get 'configs/update'
  get 'configs/delete'
  post 'configs/create'
  patch 'configs/create'
  get 'configs/create'
  #get 'configs/add'
  
  get '/configs/show_index/:id',to:'configs#show_index'
  get 'configs/show/:id',to:'configs#show'
  get 'configs/delete_all'
  get 'configs/delete/:id' ,to:'configs#delete'
  
end

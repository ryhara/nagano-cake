Rails.application.routes.draw do
  root to: 'public/homes#top'
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

# 顧客用
# URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  get '/customers/my_page' => 'public/customers#show'
  get '/customers/information/edit' => 'public/customers#edit'
  patch '/customers/information' => 'public/customers#update'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw'
  get '/about' => 'public/homes#about'
  get '/items' => 'public/items#index'
  get '/items/:id' => 'public/items#show' ,as: 'item'
  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'
  post '/orders/confirm' => 'public/orders#confirm'
  get '/orders/complete' => 'public/orders#complete'
  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:new, :index,:show, :create]
  end
  
# 管理者用
# URL /admin/sign_in ...
  
  get '/admin' => 'admin/homes#top'
  get '/admin/customers' => 'admin/customers#index'
  patch '/admin/orders/:order_id/order_items/:id' => 'admin/order_items#update'
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :create, :new, :show]
    resources :orders, only: [:index, :show, :update] do
      resources :order_items, only: [:update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

PushvendorPos::Application.routes.draw do

  resources :payrolls
  resources :employees
  resources :expenses
  resources :item_stocks
  root  to: 'websites#index', as: 'discount'
  get '/single_item', to: 'websites#single_item', as: 'single_item'
  get '/add_to_cart', to: 'websites#add_to_cart', as: 'add_to_cart'
  get '/buy_now', to: 'websites#buy_now', as: 'buy_now'
  get '/list_cart', to: 'websites#list_cart', as: 'list_cart'
  get '/destroy_cart_item', to: 'websites#destroy_cart_item', as: 'destroy_cart_item'
  get '/popup_checkout', to: 'websites#popup_checkout', as: 'popup_checkout'
  get '/save_order', to: 'websites#save_order', as: 'save_order'
  get '/change_cart_qty', to: 'websites#change_cart_qty', as: 'change_cart_qty'

  
  

  resources :suppliers
  resources :items_returns
  resources :item_categories

  resources :reports do
    collection do
      get 'total_report'
      get 'date_range_report'
      get 'customer_report'
      get 'item_report'
    end
  end

  resources :line_items

  resources :payments do
    collection do
      post 'make_payment'
    end
  end

  resources :configurations do 
    collection do 
      get 'update'
    end
  end

  resources :customers do
    collection do
      get 'auto_search'
    end
  end

  resources :items do
    get 'search'
    collection do
      get 'search'
      get 'auto_search'
      post 'import'
      get 'pick_file'
      get 'finish_record'
    end
  end

  resources :sales do
    collection do
      get 'update_line_item_options'
      get 'update_customer_options'
      get 'create_line_item'
      get 'update_totals'
      get 'add_item'
      get 'remove_item'
      get 'create_customer_association'
      get 'create_custom_item'
      get 'create_custom_customer'
      get 'add_comment'
      get 'online'
      post 'override_price'
      post 'override_quantity'
      post 'sale_discount'

    end
    member do
      get 'make_receipt'
      get 'remove_item'
      get 'remove_all_items'
      get 'get_sale_obj'
      get 'change_status'
      get 'update_account_no'
    end
  end

  resources :dashboard do
    collection do
      get 'create_sale_with_product'
    end
  end

  devise_for :users
  resources :users do
    collection do
      post 'new_user'
    end
  end

  get '/index', to: 'home#index', as: 'index'
  get '/free', to: 'home#sign_up', as: 'free'
  post '/free_trial_save', to: 'home#free_trial_save', as: 'free_trial_save'
  get '/save_store', to: 'home#save_store', as: 'save_store'
  

  

  get 'pos',to: 'dashboard#index'
end

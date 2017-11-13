Rails.application.routes.draw do
  resources :pos_inv_invoices do
    collection do
      get 'category'
    end
  end
  resources :pos_usr_lorries
  resources :pos_usr_transpoters
  devise_for :pos_usr_users
  root "pos_usr_transpoters#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

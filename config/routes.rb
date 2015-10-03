Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, controllers: { registrations: "admin/user" }

  namespace :api do
    resources :categories, only: [:index, :show]
    resources :issues, only: [:index]
  end

  namespace :admin do
    root to:'home#index'

    resources :user, as: :users, except: [:show] do
      get "roles", on: :member
    end

    resources :page, as: :pages

    resources :category, as: :categories, except: [:show]

    resources :article, as: :articles do
      get 'page/:page', action: :index, on: :collection
      get 'search', on: :collection
    end

    resources :ordering, as: :orderings, only: [:index, :destroy]  do
      post "update_issue", on: :collection
      get 'priority', on: :collection
      post "sorter", on: :collection
    end

    resources :issue, as: :issues, except: [:show] do
      get 'search', on: :collection
    end

    resources :navigator, as: :navigators, except: [:show] do
      post "sorter", on: :collection
    end

    resources :block, as: :blocks, except: [:show] do
      post "sorter", on: :collection
    end

    resources :banner, as: :banners, except: [:show] do
      post "sorter", on: :collection
    end

    resources :setting, as: :settings, only: [:create, :update, :destroy] do
      get "current_issue", on: :collection
      get "block_placements", on: :collection
    end
  end
end

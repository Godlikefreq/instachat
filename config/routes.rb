Rails.application.routes.draw do
  root to: "rooms#index"
  get "set_theme", to: "theme#update"

  resources :rooms, only: %i[ create index show ], param: :token do
    resources :messages, only: %i[ create show ]
  end

  mount ActionCable.server => "/cable"
end

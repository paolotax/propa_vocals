Rails.application.routes.draw do

  root "pages#home"
  resource :dashboard, only: :show

  resource :registration, only: %i[new create]
  resource :session, only: %i[new create destroy]
  resource :password_reset, only: %i[new create edit update]
  resource :password, only: %i[edit update]

  get "up" => "rails/health#show", as: :rails_health_check
end

Rails.application.routes.draw do
  root "pages#home"
  resource :dashboard, only: :show

  get "up" => "rails/health#show", as: :rails_health_check
end

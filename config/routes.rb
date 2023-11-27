Rails.application.routes.draw do
  resources :clients do
    resources :parents
  end
end

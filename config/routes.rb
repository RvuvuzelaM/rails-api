Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
    resources :project do
      resources :group do
        resources :note
      end
    end
  end
end
end

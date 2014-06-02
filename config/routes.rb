MusicApp::Application.routes.draw do
  root to: "sessions#new"
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]

  shallow do
    resources :bands do
      resources :albums do
        resources :tracks
      end
    end
  end
  
end

Rails.application.routes.draw do
  resources :ceps

  get 'cep/:id',    to: 'ceps#show'
  get 'enderecos',  to: 'ceps#index'
  get 'busca/:cep', to: 'ceps#busca'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  post 'cadastro', to: 'ceps#create'
end

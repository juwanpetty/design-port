Rails.application.routes.draw do
  resources :projects

  get 'welcome/index'
  root 'welcome#index'

  get 'about', to: 'welcome#about'

end

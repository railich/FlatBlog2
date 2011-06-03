FlatBlog2::Application.routes.draw do

  

  devise_for :users

  root :to => 'articles#index'

  resources :articles do
    resources :comments
    resources :votes
  end
 
  match ':controller(/:action(/:id(.:format)))'
end

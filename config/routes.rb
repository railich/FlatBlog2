FlatBlog2::Application.routes.draw do

  

  devise_for :users

  root :to => 'articles#index'

  resources :articles do
    resources :comments
    resources :votes
  end
 
  match 'articles/:id/update_rating' => 'articles#update_rating', :as => :update_rating, :via => 'get'
  match ':controller(/:action(/:id(.:format)))'
end

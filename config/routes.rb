Rails.application.routes.draw do

  root 'session#index'

  post 'event/(:event_id)/guest_list' => 'guest_list#create', as:'guest_list_create'
  delete 'guest_list/(:id)' => 'guest_list#destroy', as: 'guest_list_destroy'
# Comments ~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=
  post 'event/(:event_id)/comment' => "comment#create", as: "comment_create"
  delete 'comment/(:id)' => "comment#destroy", as: "comment_destroy"
# Events ~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=
  get 'event/index'
  get 'event/new'
  post 'event/create'
  get 'event/:id' => 'event#show', as: 'event_show'
  post 'event/:id' => 'event#update', as: 'event_update'
  delete 'event/:id' => 'event#destroy', as: 'event_destroy'
# Users  ~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=
  get 'user/index'
  post 'user/create'
  post 'user/register' => 'user#create'
  get 'user/new'
  get 'user/register' => 'user#new'
  get 'user/:id' => 'user#show', as: 'user_show'
  post 'user/:id' => 'user#update', as: 'user_update'
  delete 'user/:id' => 'user#destroy', as: 'user_destroy'
# Sessions ~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=
  get 'session/index'
  get '/login' => 'session#index'
  post 'session/create'
  post 'session/login' => 'session#create'
  post '/login' => 'session#create'
  get 'session/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

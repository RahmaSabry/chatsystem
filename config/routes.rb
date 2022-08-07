Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :applications
  post "/chats", to:"chats#create"
  get "/applications/:application_token/chats", to:"applications#chats"
  post "/messages", to:"messages#create"
  get "/messages/search/:chat_number", to:"messages#search"
  
end

Rails.application.routes.draw do
  get 'modify/edit'
  get 'modify/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"

  post '/test_openai', to: 'openai#test_openai'
  get '/test_openai', to: 'openai#test_openai'
  get '/response_page', to: 'openai#response_page', as: :response_page

  post '/test_openai_reply', to: 'openai_replies#test_openai_reply'
  get '/test_openai_reply', to: 'openai_replies#test_openai_reply'

  get '/modify', to: 'modify#edit', as: :edit_modify
  post '/modify', to: 'modify#update', as: :update_modify

end

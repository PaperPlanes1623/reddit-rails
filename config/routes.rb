Rails.application.routes.draw do
  #root route
      #-controller#action
    root 'subs#index'

  #resources 
    # resources :controller
    # only: [:index, :show] --generates only index and show route
    # except: [:index, :show] --generates all routes except index and show
    resources :subs do
      resources :topics
    end

    resources :topics do
      resources :comments
    end

  #custom routes
    #http verb 'controller/action', as: bananas, to:
    # get '/edit', to: 'subs#edit'
    # get '/show', to: 'subs#show'
    #               #placeholder
    # delete '/subs/:id', to: 'subs#destroy'
end

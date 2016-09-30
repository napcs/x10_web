X10Web::Application.routes.draw do

  post "api/on"
  post "api/off"

  resources :units do
    resource :status, :only => "update"
  end

  root :to =>  'dashboard#show'
end

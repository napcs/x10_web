X10Web::Application.routes.draw do

  resources :units do
    resource :status, :only => "update"
  end

  root :to =>  'dashboard#show'
end

Rails.application.routes.draw do  
  root 'traps#index'
 #  resources :traps do
	# 	resources :requests, only: [:index, :show, :destroy]
	# end
                   
get    ':trap_id/requests',     to:    'requests#index',   as: 'trap'
get    ':trap_id/requests/:id', to:    'requests#show',    as: 'request'
delete ':trap_id/requests/:id',          to:    'requests#destroy', as: 'destroy_request'
get    '/traps',                to:    'traps#index'
post   '/traps',                to:    'traps#create'
get    '/traps/new',            to:    'traps#new'
get    ':id/edit',              to:    'traps#edit',       as: 'edit_trap'
# get    ':id',                 to:    'traps#show',       as: 'trap'
# patch  ':id',                 to:    'traps#update' 
# put    ':id',                 to:    'traps#update' 
# delete ':id',                 to:    'traps#destroy' 
match '/:trap_id/*a' , to: 'requests#create', via: :all	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

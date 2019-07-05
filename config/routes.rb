Rails.application.routes.draw do
  root 'contacts#index'
  # resources :contacts
  # get 'contacts/index'
  # get 'contacts/new', as: 'new_contact'
  # post 'contacts/create', as: 'create_contact'
  # get 'contacts/:id/edit', to: 'contacts#edit', as: 'edit_contact'
  # patch 'contacts/:id/update', to: 'contacts#update', as: 'update_contact'
  # delete 'contacts/:id/destroy', to: 'contacts#destroy', as: 'destroy_contact'
  resources 'contacts', except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

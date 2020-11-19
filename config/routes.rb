Rails.application.routes.draw do
	devise_for :students
	get 'welcome/index'
	root to: 'welcome#index'
		resources :users
end

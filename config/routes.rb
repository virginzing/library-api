Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      scope 'users' do
        post    '/'           => 'users#register'       , as: 'register_user' 
      end

      scope 'auth' do
        post    '/login'      => 'authentication#login' , as: 'user_login' 
        delete  '/logout'     => 'authentication#logout', as: 'user_logout' 
      end

      scope 'books' do
        post    ':id/rent'    => 'books#rent'           , as: 'user_rent_book_id' 
        post    ':id/return'  => 'books#return'         , as: 'user_return_book_id' 
      end
    end
  end
end

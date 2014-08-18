Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions"}, skip: [:sessions, :registrations]
  as :user do
    get    "sign_in"   => "devise/sessions#new",        as: :new_user_session
    post   "signin"   => "devise/sessions#create",     as: :user_session
    get    "sign_out" => "devise/sessions#destroy",     as: :destroy_user_session

    get    "sign_up"  => "devise/registrations#new",    as: :new_user_registration
    post   "signup"  => "devise/registrations#create", as: :user_registration
    put    "signup"  => "devise/registrations#update", as: :update_user_registration
    delete "signup" => "devise/registrations#destroy", as: :destroy_user
    get    "account" => "devise/registrations#edit",   as: :edit_user_registration
  end
end

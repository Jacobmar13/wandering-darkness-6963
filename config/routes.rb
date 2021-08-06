Rails.application.routes.draw do

  resources :plots do
    get 'remove_plant', on: :member
  end

end

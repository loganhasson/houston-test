HoustonTest::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "devices/register"
      get "notifications/new"
      # get "session/create"
      # get "session/destroy"
      # get "account/update"
      # get "account/show"
      # get "secret/validate"
      # get "secret/email"
      # get "wishlist/create" => "wishlists#create"
      # get "wishlists" => "wishlists#index"
      # get "wishlists/:id/destroy" => "wishlists#destroy"
      # get "items/:id/add_purchase_queue" => "items#add_purchase_queue"
      # get "items/:id/remove_purchase_queue" => "items#remove_purchase_queue"
    end
  end
end

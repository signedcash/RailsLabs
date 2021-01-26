Rails.application.routes.draw do
  root 'home#input'
  get 'home/input', :as => 'input'
  get 'home/output', :as => 'output'
end


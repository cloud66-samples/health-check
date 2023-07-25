Rails.application.routes.draw do
  get 'health', action: :health, controller: 'health'
  get 'healthz', action: :healthz, controller: 'health'
  get 'sleepy_health', action: :sleepy_health, controller: 'health'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'widgets#index', as: 'widgets'

  post '/widget/title/edit', to: 'widgets#edit_title', as: 'edit_title'
  get  '/widget/title/show', to: 'widgets#show_title', as: 'show_title'
  post '/widget/title/change', to: 'widgets#change_title', as: 'change_title'
  post '/widget/title/change', to: 'widgets#change_title', as: 'objs'
end

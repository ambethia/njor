Rails.application.routes.draw do
  scope :api do
    with_options only: [:index, :show] do |read_only|
      read_only.resources :playable_classes do
        read_only.resources :specializations
      end
    end

    resources :keymaps do
      resources :action_bars do
        resources :action_buttons do
          resources :keybind
        end
      end
    end

    resources :categories
    resources :abilities
  end
end

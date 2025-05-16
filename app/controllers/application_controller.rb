class ApplicationController < ActionController::Base
  # require Rails.root.join('app/services/tax_calculator')
  # require Rails.root.join('app/services/tax_rates')
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end

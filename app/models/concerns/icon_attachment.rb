module IconAttachment
  extend ActiveSupport::Concern

  included do
    has_one_attached :icon
  end

  def icon_path
    if icon.attached?
      Rails.application.routes.url_helpers.rails_blob_path(icon, only_path: true)
    end
  end
end

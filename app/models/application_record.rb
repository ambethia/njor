class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def serializable_hash(options = {})
    options.reverse_merge!({ except: [:created_at, :updated_at] })
    super(options)
  end
end

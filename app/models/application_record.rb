class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def serializable_hash(options = {})
    options.reverse_merge!({ except: [:created_at, :updated_at] })
    # options.reverse_merge!({ methods: [:icon_path] }) if respond_to? :icon_path
    super(options)
  end
end

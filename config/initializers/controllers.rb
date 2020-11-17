Rails.application.config.after_initialize do
  Dir.glob(Rails.root.join("app/models/*")).each { |m| require(m) }

  ApplicationRecord.descendants.each do |model|
    klass = Class.new(ResourceController)
    Object.const_set "#{model.model_name.plural.camelize}Controller", klass
  end
end

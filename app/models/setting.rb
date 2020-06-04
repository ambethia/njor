class Setting < ApplicationRecord

  def self.[](name)
    Setting.where(name: name).first&.value
  end

  def self.[]=(name, value)
    setting = Setting.find_or_initialize_by(name: name)
    setting.update value: value
  end
end

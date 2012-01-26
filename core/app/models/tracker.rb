class Tracker < ActiveRecord::Base
  ANALYTICS_TYPES = ["google_analytics", "yandex_metrics"].freeze
  validates :analytics_type, :presence => true, :inclusion => {:in => ANALYTICS_TYPES}

  scope :active, where(:active => true, :environment => ENV['RAILS_ENV'])

  def analytics_type_name
    I18n.t self.analytics_type
  end

  def self.analytics_types
    ANALYTICS_TYPES.map {|type| [type, I18n.t(type)]}
  end
end

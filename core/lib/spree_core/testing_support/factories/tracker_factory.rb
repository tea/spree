Factory.define(:tracker) do |f|
  f.environment { Rails.env }
  f.analytics_id 'A100'
  f.analytics_type "google_analytics"
  f.active true
end

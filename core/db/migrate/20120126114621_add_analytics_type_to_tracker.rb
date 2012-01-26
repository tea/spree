class AddAnalyticsTypeToTracker < ActiveRecord::Migration
  class Tracker < ActiveRecord::Base
  end

  def self.up
    add_column :trackers, :analytics_type, :string

    Tracker.reset_column_information
    Tracker.update_all :analytics_type => "google_analytics"
  end

  def self.down
    remove_column :trackers, :analytics_type
  end
end

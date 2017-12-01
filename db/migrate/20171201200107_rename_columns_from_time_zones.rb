class RenameColumnsFromTimeZones < ActiveRecord::Migration[5.1]
  def change
    rename_column(:time_zones, :name, :key)
    rename_column(:time_zones, :description, :name)
  end
end

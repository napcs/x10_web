class AddPositionToUnits < ActiveRecord::Migration
  def change
    add_column :units, :position, :integer
  end
end

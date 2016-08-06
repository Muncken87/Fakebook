class CreateWalls < ActiveRecord::Migration[5.0]
  def change
    create_table :walls do |t|

      t.timestamps
    end
  end
end

class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string    :title
    end
  end
end

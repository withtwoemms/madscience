class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.text       :instructions
      t.references :experiment

      t.timestamps
    end
  end
end

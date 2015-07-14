class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string       :name
      t.text         :summary
      t.text         :hypothesis
      t.references   :creator

      t.timestamps
    end
  end
end

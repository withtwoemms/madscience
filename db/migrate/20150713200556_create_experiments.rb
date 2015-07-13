class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string      :name
      t.text        :results
      t.text        :conclusion
      t.references  :proposal

      t.timestamps
    end
  end
end

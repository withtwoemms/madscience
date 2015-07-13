class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.text        :content
      t.references  :observable, polymorphic: true, index: true

      t.timestamps
    end
  end
end

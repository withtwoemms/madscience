class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
        t.string       :name
        t.text         :summary
        t.text         :hypothesis
        t.references   :creator

        t.timestamps
    end
  end
end

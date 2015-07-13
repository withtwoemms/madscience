class CreateResearchGroups < ActiveRecord::Migration
  def change
    create_table :research_groups do |t|
      t.references  :user
      t.references  :proposal

      t.timestamps
    end
  end
end

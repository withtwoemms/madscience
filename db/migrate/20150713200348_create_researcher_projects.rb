class CreateResearcherProjects < ActiveRecord::Migration
  def change
    create_table :researcher_projects do |t|
      t.references  :researcher
      t.references  :project

      t.timestamps
    end
  end
end

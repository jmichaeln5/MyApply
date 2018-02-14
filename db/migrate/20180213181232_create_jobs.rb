class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :position
      t.string :language
      t.string :skills
      t.string :state
      t.string :salary
      t.text :comments
      t.string :site

      t.timestamps
    end
  end
end

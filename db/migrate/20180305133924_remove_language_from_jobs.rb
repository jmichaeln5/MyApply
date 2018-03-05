class RemoveLanguageFromJobs < ActiveRecord::Migration[5.1]
  def change
    remove_column :jobs, :language 
  end
end

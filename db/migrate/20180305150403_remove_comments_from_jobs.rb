class RemoveCommentsFromJobs < ActiveRecord::Migration[5.1]
  def change
        remove_column :jobs, :comments
  end
end

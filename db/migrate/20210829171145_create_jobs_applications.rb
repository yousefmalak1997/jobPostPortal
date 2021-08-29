class CreateJobsApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs_applications do |t|
      t.references :users, null: false, foreign_key: true
      t.references :jobs, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end

class IndividualsJobCastsJoin < ActiveRecord::Migration
 
  def change
    create_table :individuals_job_casts, :id => false do |t|
      t.integer "individual_id"
      t.integer "job_cast_id"
    end
    add_index :individuals_job_casts, ["individual_id", "job_cast_id"]
  end

end

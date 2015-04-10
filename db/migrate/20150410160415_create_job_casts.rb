class CreateJobCasts < ActiveRecord::Migration

  def change
    create_table :job_casts do |t|
      t.integer "organization_id"
      t.string :title
      t.text :description
      t.integer :compensation_min
      t.integer :compensation_max
      t.text :skills
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country_code

      t.timestamps null: false
    end
    add_index :job_casts, "organization_id"
  end

end

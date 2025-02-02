class CreateSubmissions < ActiveRecord::Migration[7.1]
  def change
    create_table :submissions do |t|
      t.string :name
      t.string :email
      t.string :mobile_phone
      t.string :resume
      t.string :blob
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end

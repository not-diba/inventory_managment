class CreateAdministrators < ActiveRecord::Migration[7.0]
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :department_id
      t.string :password_digest

      t.timestamps
    end
  end
end

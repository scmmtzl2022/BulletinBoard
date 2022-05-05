class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :password_digest
      t.string :profile
      t.string :role
      t.string :phone
      t.string :address
      t.date :dob
      t.bigint :created_user_id
      t.bigint :updated_user_id
      t.integer :deleted_user_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

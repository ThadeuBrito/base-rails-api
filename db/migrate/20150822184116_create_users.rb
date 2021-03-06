class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :null => false, unique: true
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :encrypted_password, :null => false
      t.string :access_token, :null => false, unique: true
      t.boolean :admin

      t.timestamps null: false
    end
  end
end

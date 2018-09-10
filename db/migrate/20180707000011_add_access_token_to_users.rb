class AddAccessTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :access_token, null: false, default: ""
      t.index :access_token, unique: true
    end
  end
end

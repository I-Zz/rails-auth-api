class CreateJwtDenylist < ActiveRecord::Migration[6.1]
  def change
    create_table :jwt_denylist do |t|
      t.string :jti, null: false
      t.datetime :exp
      t.timestamps
    end
    add_index :jwt_denylist, :jti, unique: true
  end
end

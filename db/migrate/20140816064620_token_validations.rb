class TokenValidations < ActiveRecord::Migration
  def change
    add_index :tokens, :token, unique: true
  end
end

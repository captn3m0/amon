class Token < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string 'token'
      t.text 'info'
      t.string 'provider'
      t.timestamps
    end
  end
end

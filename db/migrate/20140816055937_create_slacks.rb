class CreateSlacks < ActiveRecord::Migration
  def change
    create_table :slacks do |t|

      t.timestamps
    end
  end
end

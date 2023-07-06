class CreateElection < ActiveRecord::Migration[7.0]
  def change
    create_table :elections do |t|
      t.string :name
      t.integer :priority
      t.integer :year
      t.boolean :runoff

      t.timestamps
    end
  end
end

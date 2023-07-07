class CreateCandidate < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.integer :votes
      t.boolean :incumbent

      t.timestamps
    end
  end
end

class CreateHiddenNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :hidden_notes do |t|
      t.text :your_note

      t.timestamps
    end
  end
end

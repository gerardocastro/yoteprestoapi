class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :first_name
      t.string :second_name
      t.string :f_last_name
      t.string :s_last_name
      t.string :mobile
      t.string :relation_type
      t.references :application, index: true

      t.timestamps null: false
    end
  end
end

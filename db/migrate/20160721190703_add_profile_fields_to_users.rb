class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, limit: 100
    add_column :users, :second_name, :string, limit: 100
    add_column :users, :f_last_name, :string, limit: 100
    add_column :users, :s_last_name, :string, limit: 100
    add_column :users, :sex, :string, limit: 10
    add_column :users, :birth_day, :datetime
    add_column :users, :curp, :string, limit: 18
    add_column :users, :rfc, :string, limit: 13
    add_column :users, :mobile, :string, limit: 20
    add_column :users, :phone, :string, limit: 20
    add_column :users, :finished, :bool, default: false
  end
end

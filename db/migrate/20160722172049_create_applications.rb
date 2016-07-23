class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :loan_title
      t.text   :loan_detail
      t.string :loan_destination
      t.string :funding_days
      t.boolean :has_credit_card, default: false
      t.boolean :has_insurance, default: false
      t.boolean :has_car, default: false
      t.string :other_income
      t.string :education
      t.string :pay_job
      t.string :year_job
      t.string :company_job
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end

class Api::V1::ExpenseSerializer < ActiveModel::Serializer
  attributes *Expense.column_names
end

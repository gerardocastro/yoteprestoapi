class Api::V1::ApplicationSerializer < ActiveModel::Serializer
  attributes *Application.column_names

  has_many :expenses, key: :expenses_attributes
  has_many :references, key: :references_attributes
end

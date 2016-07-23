class Api::V1::ReferenceSerializer < ActiveModel::Serializer
  attributes *Reference.column_names
end

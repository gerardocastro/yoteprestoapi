class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :image, :first_name, :second_name, :f_last_name, :s_last_name, 
      :sex, :curp, :rfc, :mobile, :phone, :password, :finished

  def password
    ''
  end
end

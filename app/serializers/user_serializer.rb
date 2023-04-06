class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :full_name, :age, :address, :gender, :favorite_categories
end

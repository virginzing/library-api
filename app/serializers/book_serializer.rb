class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :author, :description, :category
end

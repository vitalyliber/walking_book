module Types
  BookType = GraphQL::ObjectType.define do
    name 'Book'
    description 'a description'

    field :title, !types.String
    field :description, !types.String
    field :id, !types.Int
    field :authorId, !types.Int, property: :author_id
    field :user, !UserType
  end
end
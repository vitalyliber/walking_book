module Types
  BookType = GraphQL::ObjectType.define do
    name 'Book'
    description 'a description'

    field :id, !types.Int
    field :title, !types.String
    field :description, !types.String
    field :category, !types.String
    field :status, !types.String
    field :authorId, !types.Int, property: :author_id
    field :author, !AuthorType
    field :user, !UserType
  end
end
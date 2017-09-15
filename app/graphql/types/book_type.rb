module Types
  BookType = GraphQL::ObjectType.define do
    name 'Book'
    description 'a description'

    field :id, !types.Int
    field :title, !types.String
    field :description, !types.String
    field :category, !types.String
    field :status, !types.String
    field :authorName, !types.Int, property: :author_name
    field :user, !UserType
    field :histories, !types[Types::HistoryType]
  end
end
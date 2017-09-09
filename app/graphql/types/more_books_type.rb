module Types
  MoreBooksType = GraphQL::ObjectType.define do
    name 'More Books'
    description 'a description'

    field :cursor, !types.Int
    field :books, types[Types::BookType]
  end
end
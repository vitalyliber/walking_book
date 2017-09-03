module Types
  AuthorType = GraphQL::ObjectType.define do
    name 'Author'
    description 'a description'

    field :id, !types.Int
    field :first_name, !types.String
    field :last_name, !types.String
    field :books, !types[Types::BookType]
  end
end
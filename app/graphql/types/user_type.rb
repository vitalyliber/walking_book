module Types
  UserType = GraphQL::ObjectType.define do
    name 'User'
    description 'a description'

    field :first_name, !types.String
    field :last_name, !types.String
    field :email, !types.String
    field :id, !types.Int
    field :books, !types[Types::BookType]
  end
end
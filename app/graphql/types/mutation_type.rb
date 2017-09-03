Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createAuthor, Mutations::CreateAuthor.field
  field :createBook, Mutations::CreateBook.field
end

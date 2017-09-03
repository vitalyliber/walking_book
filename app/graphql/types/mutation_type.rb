Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createBook, Mutations::CreateBook.field
end

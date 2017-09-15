Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createFeedback, Mutations::CreateFeedback.field
  field :createBook, Mutations::CreateBook.field
end

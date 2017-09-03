# mutation createAuthor{
#   createAuthor(input: { first_name: "Salvador", last_name: "Dali" })
#   {
#     author{
#       id
#       first_name
#       last_name
#     }
#     errors
#   }
# }

Mutations::CreateAuthor = GraphQL::Relay::Mutation.define do
  name "CreateAuthor"

  return_field :author, Types::AuthorType
  return_field :errors, types.String

  input_field :first_name, !types.String
  input_field :last_name, !types.String


  resolve ->(obj, args, ctx) {
    author = Author.new(
        first_name: args[:first_name],
        last_name: args[:last_name],
    )
    if author.save
      { author: author }
    else
      { errors: author.errors.to_a }
    end
  }
end

# mutation createBook{
#   createBook(input: { title: "Hello", author_id: 1, category: "fiction", description: "wow" })
#   {
#       book{
#         id
#         title
#         description
#         authorId
#         status
#         user{
#           id
#           first_name
#         }
#       }
#   errors
# }
# }

Mutations::CreateBook = GraphQL::Relay::Mutation.define do
  name "CreateBook"
  return_field :book, Types::BookType
  return_field :errors, types.String

  input_field :title, !types.String
  input_field :description, !types.String
  input_field :author_id, !types.Int
  input_field :category, !types.String

  resolve ->(obj, args, ctx) {
    book = Book.new(
        title: args[:title],
        description: args[:description],
        author_id: args[:author_id],
        category: args[:category],
        user: ctx[:current_user]
    )
    if book.save
      { book: book }
    else
      { errors: book.errors.to_a }
    end
  }
end

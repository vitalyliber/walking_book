# mutation createBook{
#   createBook(input: { title: "Hello", authorName: "One Man", category: "fiction", description: "wow" })
#   {
#       book{
#         id
#         title
#         description
#         authorName
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
  input_field :authorName, !types.String
  input_field :category, !Types::CategoryEnum

  resolve ->(obj, args, ctx) {
    book = Book.new(
        title: args[:title],
        description: args[:description],
        author_name: args[:authorName],
        category: args[:category],
        user: ctx[:current_user],
    )
    if book.save
      { book: book }
    else
      { errors: book.errors.to_a }
    end
  }
end

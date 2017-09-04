Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :books, types[Types::BookType] do
    description "Book field"
    resolve ->(obj, args, ctx) {Book.all.order(id: :desc)}
  end

  field :authors, types[Types::AuthorType] do
    description "Author field"
    resolve ->(obj, args, ctx) {Author.all.order(id: :desc)}
  end

  field :me, Types::UserType do
    description "the current user"
    resolve ->(obj, args, ctx) {ctx[:current_user]}
  end

  field :my_books, types[Types::BookType] do
    description "Book field"
    resolve ->(obj, args, ctx) {ctx[:current_user]&.books}
  end
end
